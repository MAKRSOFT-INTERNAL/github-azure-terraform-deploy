variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "aks_system_subnet_prefix" {
  type = string
}

variable "aks_user_subnet_prefix" {
  type = string
}

variable "private_endpoint_subnet_prefix" {
  type = string
}

variable "app_gateway_subnet_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
}
