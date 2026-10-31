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

  resource_group_name             = data.azurerm_resource_group.spoke.name
  location                        = data.azurerm_resource_group.spoke.location
  vnet_name                       = var.spoke_vnet_name
  address_space                   = var.spoke_address_space
  aks_system_subnet_prefix        = var.aks_system_subnet_prefix
  aks_user_subnet_prefix          = var.aks_user_subnet_prefix
  private_endpoint_subnet_prefix  = var.private_endpoint_subnet_prefix
  app_gateway_subnet_prefix       = var.app_gateway_subnet_prefix
  tags                            = local.spoke_tags
}

module "vnet_peering" {
  source = "./modules/vnet-peering"

  hub_resource_group_name   = data.azurerm_resource_group.hub.name
  hub_vnet_name             = module.hub_network.vnet_name
  hub_vnet_id               = module.hub_network.vnet_id

  spoke_resource_group_name = data.azurerm_resource_group.spoke.name
  spoke_vnet_name           = module.aks_spoke_network.vnet_name
  spoke_vnet_id             = module.aks_spoke_network.vnet_id
}
