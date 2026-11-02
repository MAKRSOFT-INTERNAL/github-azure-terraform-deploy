variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "Central India"
}

variable "hub_resource_group_name" {
  description = "Existing resource group containing the Hub network."
  type        = string
  default     = "rg-network"
}

variable "spoke_resource_group_name" {
  description = "Existing resource group containing the AKS Spoke network."
  type        = string
  default     = "rg-app-dev"
}

variable "hub_vnet_name" {
  description = "Hub VNet name."
  type        = string
  default     = "vnet-hub"
}

variable "hub_address_space" {
  description = "Hub VNet address space."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "gateway_subnet_prefix" {
  description = "GatewaySubnet CIDR."
  type        = string
  default     = "10.0.0.0/27"
}

variable "firewall_subnet_prefix" {
  description = "AzureFirewallSubnet CIDR."
  type        = string
  default     = "10.0.1.0/26"
}

variable "spoke_vnet_name" {
  description = "AKS Spoke VNet name."
  type        = string
  default     = "vnet-aks-spoke"
}

variable "spoke_address_space" {
  description = "AKS Spoke VNet address space."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "aks_system_subnet_prefix" {
  description = "AKS system node subnet CIDR."
  type        = string
  default     = "10.10.0.0/22"
}

variable "aks_user_subnet_prefix" {
  description = "AKS user node subnet CIDR."
  type        = string
  default     = "10.10.4.0/22"
}

variable "private_endpoint_subnet_prefix" {
  description = "Private endpoint subnet CIDR."
  type        = string
  default     = "10.10.8.0/24"
}

variable "app_gateway_subnet_prefix" {
  description = "Application Gateway subnet CIDR."
  type        = string
  default     = "10.10.9.0/24"
}

variable "aks_cluster_name" {
  description = "AKS cluster name."
  type        = string
  default     = "aks-app-dev"
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS API server."
  type        = string
  default     = "aks-app-dev"
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version. Leave null to use the Azure default."
  type        = string
  default     = null
  nullable    = true
}

variable "aks_system_vm_size" {
  description = "VM size for the AKS system node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_system_node_count" {
  description = "Initial node count for the AKS system node pool."
  type        = number
  default     = 1
}

variable "aks_system_min_count" {
  description = "Minimum autoscaled node count for the AKS system node pool."
  type        = number
  default     = 1
}

variable "aks_system_max_count" {
  description = "Maximum autoscaled node count for the AKS system node pool."
  type        = number
  default     = 3
}

variable "aks_user_vm_size" {
  description = "VM size for the AKS user node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_user_node_count" {
  description = "Initial node count for the AKS user node pool."
  type        = number
  default     = 1
}

variable "aks_user_min_count" {
  description = "Minimum autoscaled node count for the AKS user node pool."
  type        = number
  default     = 1
}

variable "aks_user_max_count" {
  description = "Maximum autoscaled node count for the AKS user node pool."
  type        = number
  default     = 3
}

variable "aks_pod_cidr" {
  description = "Non-overlapping pod CIDR for Azure CNI Overlay."
  type        = string
  default     = "10.244.0.0/16"
}

variable "aks_service_cidr" {
  description = "Non-overlapping Kubernetes service CIDR."
  type        = string
  default     = "10.20.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "DNS service IP inside the Kubernetes service CIDR."
  type        = string
  default     = "10.20.0.10"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Common resource tags."
  type        = map(string)

  default = {
    Environment  = "dev"
    ManagedBy    = "Terraform"
    Source       = "GitHub-Actions"
    Architecture = "Hub-Spoke"
    Platform     = "Azure"
  }
}
