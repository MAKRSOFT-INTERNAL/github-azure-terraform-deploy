output "vnet_id" {
  value = azurerm_virtual_network.spoke.id
}

output "vnet_name" {
  value = azurerm_virtual_network.spoke.name
}

output "aks_system_subnet_id" {
  value = azurerm_subnet.aks_system.id
}

output "aks_user_subnet_id" {
  value = azurerm_subnet.aks_user.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}

output "app_gateway_subnet_id" {
  value = azurerm_subnet.app_gateway.id
}
