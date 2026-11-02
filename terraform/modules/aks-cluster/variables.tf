variable "name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "system_subnet_id" {
  type = string
}

variable "user_subnet_id" {
  type = string
}

variable "kubernetes_version" {
  type     = string
  default  = null
  nullable = true
}

variable "system_vm_size" {
  type = string
}

variable "system_node_count" {
  type = number
}

variable "system_min_count" {
  type = number
}

variable "system_max_count" {
  type = number
}

variable "user_vm_size" {
  type = string
}

variable "user_node_count" {
  type = number
}

variable "user_min_count" {
  type = number
}

variable "user_max_count" {
  type = number
}

variable "pod_cidr" {
  type = string
}

variable "service_cidr" {
  type = string
}

variable "dns_service_ip" {
  type = string
}

variable "tags" {
  type = map(string)
}