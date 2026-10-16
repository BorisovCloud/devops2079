locals {
  velero_plugin = "velero/velero-plugin-for-microsoft-azure:v1.14.4" # pairs with Velero 1.18.x
  bsl_config = join(",", [
    "resourceGroup=${azurerm_resource_group.this.name}",
    "storageAccount=${azurerm_storage_account.backups.name}",
    "storageAccountKeyEnvVar=AZURE_STORAGE_ACCOUNT_ACCESS_KEY",
    "subscriptionId=${var.subscription_id}",
  ])
  velero_install = <<-EOT
    velero install --kubecontext %s \
      --provider azure \
      --plugins ${local.velero_plugin} \
      --bucket ${azurerm_storage_container.velero.name} \
      --secret-file ./credentials-velero \
      --backup-location-config ${local.bsl_config} \
      --use-node-agent \
      --use-volume-snapshots=false
  EOT
}

output "aks_get_credentials" {
  description = "Adds the AKS context to ~/.kube/config next to minikube."
  value       = "az aks get-credentials --resource-group ${azurerm_resource_group.this.name} --name ${azurerm_kubernetes_cluster.this.name}"
}

output "storage_account" {
  value = azurerm_storage_account.backups.name
}

output "velero_install_minikube" {
  description = "Install Velero on the source cluster (read-write backup location)."
  value       = format(local.velero_install, "minikube")
}

output "velero_install_aks" {
  description = "Install Velero on the restore target; then make its backup location read-only (see README)."
  value       = format(local.velero_install, azurerm_kubernetes_cluster.this.name)
}
