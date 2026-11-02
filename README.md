# GitHub Azure Terraform Deploy

The network Terraform root deploys a hub VNet, an AKS spoke VNet, and VNet peering. A separate `terraform/aks` root deploys the AKS cluster into the existing resource groups configured in the environment tfvars files.

## Deployment workflows

Run `Terraform Deployment` from `.github/workflows/terraform-deploy.yml` to execute stages in dependency order. Apply runs network first and AKS second; destroy runs AKS first and network second. The `terraform-hub-spoke.yml` and `terraform-azure-aks.yml` workflows can also be dispatched individually when operating on a single stage.

Before the first AKS deployment, a subscription administrator must register the Azure resource providers required by the cluster. The workflows check registration but do not attempt it because the CI identity does not have subscription-level registration permission. Register each provider reported as unregistered:

```bash
az provider register --namespace Microsoft.Network --wait
az provider register --namespace Microsoft.ManagedIdentity --wait
az provider register --namespace Microsoft.Compute --wait
az provider register --namespace Microsoft.ContainerService --wait
az provider register --namespace Microsoft.Authorization --wait
```

The network and AKS roots maintain separate Terraform state files. Existing Azure resources are imported into the matching stage state before that stage plans changes.

## AKS node pools

The cluster uses the spoke's dedicated `snet-aks-system` and `snet-aks-user` subnets. It has a system pool for critical cluster components and a separate autoscaled user pool for workloads. Both pools use Azure CNI Overlay, with pod and service CIDRs configurable in the environment tfvars file. Choose CIDRs that do not overlap with the hub, spoke, peered networks, or other connected networks.

The AKS module creates a user-assigned identity and grants it Network Contributor on both node subnets before cluster creation.

## CI state security

The current GitHub Actions workflows commit Terraform state and backups to the repository. Terraform state can contain sensitive resource attributes, including AKS configuration. Before using this workflow for a production cluster, migrate both roots to secured remote backends, restrict access to state, and remove state files from source control history. Do not publish kubeconfig or admin credentials as Terraform outputs.