resource "azurerm_app_service_slot" "slot" {
  name = "slotstagingminipro78623"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  app_service_name = azurerm_app_service.as.name
}
