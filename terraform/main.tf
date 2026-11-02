data "azurerm_resource_group" "hub" {
  name = var.hub_resource_group_name
}

data "azurerm_resource_group" "spoke" {
  name = var.spoke_resource_group_name
}

module "hub_network" {
  source = "./modules/hub-network"

  resource_group_name    = data.azurerm_resource_group.hub.name
  location               = data.azurerm_resource_group.hub.location
  vnet_name              = var.hub_vnet_name
  address_space          = var.hub_address_space
  gateway_subnet_prefix  = var.gateway_subnet_prefix
  firewall_subnet_prefix = var.firewall_subnet_prefix
  tags                   = local.hub_tags
}

module "aks_spoke_network" {
  source = "./modules/aks-spoke-network"

  resource_group_name            = data.azurerm_resource_group.spoke.name
  location                       = data.azurerm_resource_group.spoke.location
  vnet_name                      = var.spoke_vnet_name
  address_space                  = var.spoke_address_space
  aks_system_subnet_prefix       = var.aks_system_subnet_prefix
  aks_user_subnet_prefix         = var.aks_user_subnet_prefix
  private_endpoint_subnet_prefix = var.private_endpoint_subnet_prefix
  app_gateway_subnet_prefix      = var.app_gateway_subnet_prefix
  tags                           = local.spoke_tags
}

module "aks_cluster" {
  source = "./modules/aks-cluster"

  name                = var.aks_cluster_name
  dns_prefix          = var.aks_dns_prefix
  resource_group_name = data.azurerm_resource_group.spoke.name
  location            = data.azurerm_resource_group.spoke.location
  system_subnet_id    = module.aks_spoke_network.aks_system_subnet_id
  user_subnet_id      = module.aks_spoke_network.aks_user_subnet_id

  kubernetes_version = var.kubernetes_version
  system_vm_size     = var.aks_system_vm_size
  system_node_count  = var.aks_system_node_count
  system_min_count   = var.aks_system_min_count
  system_max_count   = var.aks_system_max_count
  user_vm_size       = var.aks_user_vm_size
  user_node_count    = var.aks_user_node_count
  user_min_count     = var.aks_user_min_count
  user_max_count     = var.aks_user_max_count
  pod_cidr           = var.aks_pod_cidr
  service_cidr       = var.aks_service_cidr
  dns_service_ip     = var.aks_dns_service_ip
  tags               = local.spoke_tags
}

module "vnet_peering" {
  source = "./modules/vnet-peering"

  depends_on = [module.aks_spoke_network]

  hub_resource_group_name = data.azurerm_resource_group.hub.name
  hub_vnet_name           = module.hub_network.vnet_name
  hub_vnet_id             = module.hub_network.vnet_id

  spoke_resource_group_name = data.azurerm_resource_group.spoke.name
  spoke_vnet_name           = module.aks_spoke_network.vnet_name
  spoke_vnet_id             = module.aks_spoke_network.vnet_id
}
