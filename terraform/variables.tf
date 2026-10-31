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
