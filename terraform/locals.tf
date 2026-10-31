locals {
  hub_tags = merge(var.common_tags, {
    NetworkRole = "Hub"
  })

  spoke_tags = merge(var.common_tags, {
    NetworkRole = "AKS-Spoke"
  })
}
