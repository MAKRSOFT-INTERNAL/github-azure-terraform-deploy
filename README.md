# GitHub Azure Terraform Deploy

This Terraform root deploys a hub VNet, an AKS spoke VNet, VNet peering, and an AKS cluster into the existing resource groups configured in `terraform/environments/dev.tfvars`.

## AKS node pools

The cluster uses the spoke's dedicated `snet-aks-system` and `snet-aks-user` subnets. It has a system pool for critical cluster components and a separate autoscaled user pool for workloads. Both pools use Azure CNI Overlay, with pod and service CIDRs configurable in the environment tfvars file. Choose CIDRs that do not overlap with the hub, spoke, peered networks, or other connected networks.

The AKS module creates a user-assigned identity and grants it Network Contributor on both node subnets before cluster creation. The GitHub Actions workflow applies this Terraform root, so the AKS resources are included in its normal plan/apply process.

## CI state security

The current GitHub Actions workflow commits `terraform.tfstate` and its backup to the repository. Terraform state can contain sensitive resource attributes, including AKS configuration. Before using this workflow for a production cluster, migrate state to a secured remote backend such as Azure Storage, restrict access to that state, and remove state files from source control history. Do not publish kubeconfig or admin credentials as Terraform outputs.