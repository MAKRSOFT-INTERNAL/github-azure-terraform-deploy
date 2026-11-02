output "hub_vnet_id" {
  description = "Hub VNet resource ID."
  value       = module.hub_network.vnet_id
}

output "hub_vnet_name" {
  description = "Hub VNet name."
  value       = module.hub_network.vnet_name
}

output "spoke_vnet_id" {
  description = "AKS Spoke VNet resource ID."
  value       = module.aks_spoke_network.vnet_id
}

output "spoke_vnet_name" {
  description = "AKS Spoke VNet name."
  value       = module.aks_spoke_network.vnet_name
}

output "aks_system_subnet_id" {
  description = "AKS system node subnet ID."
  value       = module.aks_spoke_network.aks_system_subnet_id
}

output "aks_user_subnet_id" {
  description = "AKS user node subnet ID."
  value       = module.aks_spoke_network.aks_user_subnet_id
}

output "private_endpoint_subnet_id" {
  description = "Private endpoint subnet ID."
  value       = module.aks_spoke_network.private_endpoint_subnet_id
}

output "app_gateway_subnet_id" {
  description = "Application Gateway subnet ID."
  value       = module.aks_spoke_network.app_gateway_subnet_id
}
