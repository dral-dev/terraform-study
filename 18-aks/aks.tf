data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.rg.location
}

resource "azurerm_kubernetes_cluster" "aks" {

  name                = "aksminipro2323"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version

  dns_prefix = "learnaks"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_D2s_v3"

    min_count  = 1
    max_count  = 3

    auto_scaling_enabled = true
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}