resource "azurerm_app_service" "as" {
  name = "appserviceminipro87897987233"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  
}
