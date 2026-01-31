
resource "azurerm_linux_function_app" "linuxfa" {
  name                = "linuxfaminipro8932340"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.splan.id

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
    AzureWebJobsStorage      = azurerm_storage_account.sa.primary_connection_string
    STORAGE_CONNECTION_STRING = azurerm_storage_account.sa.primary_connection_string
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }

  site_config {
    application_stack {
      node_version = 18
    }
  }
}

