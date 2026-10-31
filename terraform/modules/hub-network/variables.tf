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

variable "gateway_subnet_prefix" {
  type = string
}

variable "firewall_subnet_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
}
