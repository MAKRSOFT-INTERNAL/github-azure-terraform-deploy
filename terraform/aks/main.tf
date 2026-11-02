data "azurerm_resource_group" "spoke" {
  name = var.spoke_resource_group_name
}

data "azurerm_subnet" "system" {
  name                 = var.aks_system_subnet_name
  virtual_network_name = var.spoke_vnet_name
  resource_group_name  = data.azurerm_resource_group.spoke.name
}

data "azurerm_subnet" "user" {
  name                 = var.aks_user_subnet_name
  virtual_network_name = var.spoke_vnet_name
  resource_group_name  = data.azurerm_resource_group.spoke.name
}

module "aks_cluster" {
  source = "../modules/aks-cluster"

  name                = var.aks_cluster_name
  dns_prefix          = var.aks_dns_prefix
  resource_group_name = data.azurerm_resource_group.spoke.name
  location            = data.azurerm_resource_group.spoke.location
  system_subnet_id    = data.azurerm_subnet.system.id
  user_subnet_id      = data.azurerm_subnet.user.id

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
  tags               = var.common_tags
}

output "aks_cluster_id" {
  description = "AKS cluster resource ID."
  value       = module.aks_cluster.cluster_id
}

output "aks_cluster_name" {
  description = "AKS cluster name."
  value       = module.aks_cluster.cluster_name
}