spoke_resource_group_name = "rg-app-dev"
spoke_vnet_name           = "vnet-aks-spoke"
aks_system_subnet_name    = "snet-aks-system"
aks_user_subnet_name      = "snet-aks-user"

aks_cluster_name      = "aks-app-dev"
aks_dns_prefix        = "aks-app-dev"
aks_system_vm_size    = "Standard_D2s_v5"
aks_system_node_count = 1
aks_system_min_count  = 1
aks_system_max_count  = 3
aks_user_vm_size      = "Standard_D2s_v5"
aks_user_node_count   = 1
aks_user_min_count    = 1
aks_user_max_count    = 3
aks_pod_cidr          = "10.244.0.0/16"
aks_service_cidr      = "10.20.0.0/16"
aks_dns_service_ip    = "10.20.0.10"

common_tags = {
  Environment  = "dev"
  ManagedBy    = "Terraform"
  Source       = "GitHub-Actions"
  Architecture = "Hub-Spoke"
  Platform     = "Azure"
}