# Existing resource groups from the current Azure subscription.
location                  = "Central India"
hub_resource_group_name   = "rg-network"
spoke_resource_group_name = "rg-app-dev"

# Hub
hub_vnet_name          = "vnet-hub"
hub_address_space      = ["10.0.0.0/16"]
gateway_subnet_prefix  = "10.0.0.0/27"
firewall_subnet_prefix = "10.0.1.0/26"

# AKS Spoke
spoke_vnet_name                = "vnet-aks-spoke"
spoke_address_space            = ["10.10.0.0/16"]
aks_system_subnet_prefix       = "10.10.0.0/22"
aks_user_subnet_prefix         = "10.10.4.0/22"
private_endpoint_subnet_prefix = "10.10.8.0/24"
app_gateway_subnet_prefix      = "10.10.9.0/24"

environment = "dev"

common_tags = {
  Environment  = "dev"
  ManagedBy    = "Terraform"
  Source       = "GitHub-Actions"
  Architecture = "Hub-Spoke"
  Platform     = "Azure"
}
