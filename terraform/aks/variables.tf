variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "spoke_resource_group_name" {
  description = "Resource group containing the AKS spoke network."
  type        = string
}

variable "spoke_vnet_name" {
  description = "AKS spoke virtual network name."
  type        = string
}

variable "aks_system_subnet_name" {
  description = "Subnet assigned to AKS system nodes."
  type        = string
}

variable "aks_user_subnet_name" {
  description = "Subnet assigned to AKS user nodes."
  type        = string
}

variable "aks_cluster_name" {
  description = "AKS cluster name."
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS API server."
  type        = string
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
}

variable "aks_system_node_count" {
  description = "Initial node count for the AKS system node pool."
  type        = number
}

variable "aks_system_min_count" {
  description = "Minimum autoscaled node count for the AKS system node pool."
  type        = number
}

variable "aks_system_max_count" {
  description = "Maximum autoscaled node count for the AKS system node pool."
  type        = number
}

variable "aks_user_vm_size" {
  description = "VM size for the AKS user node pool."
  type        = string
}

variable "aks_user_node_count" {
  description = "Initial node count for the AKS user node pool."
  type        = number
}

variable "aks_user_min_count" {
  description = "Minimum autoscaled node count for the AKS user node pool."
  type        = number
}

variable "aks_user_max_count" {
  description = "Maximum autoscaled node count for the AKS user node pool."
  type        = number
}

variable "aks_pod_cidr" {
  description = "Non-overlapping pod CIDR for Azure CNI Overlay."
  type        = string
}

variable "aks_service_cidr" {
  description = "Non-overlapping Kubernetes service CIDR."
  type        = string
}

variable "aks_dns_service_ip" {
  description = "DNS service IP inside the Kubernetes service CIDR."
  type        = string
}

variable "common_tags" {
  description = "Common resource tags."
  type        = map(string)
}