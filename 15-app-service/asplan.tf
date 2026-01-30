resource "azurerm_app_service_plan" "asp" {
  name = "aspminipro8972"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
