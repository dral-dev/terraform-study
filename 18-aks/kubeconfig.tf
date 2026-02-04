resource "local_file" "kubeconfig" {
  filename = "./kubeconfig"
  content  = azurerm_kubernetes_cluster.aks.kube_config_raw
}
