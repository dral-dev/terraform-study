resource "azurerm_mssql_server" "sql_server" {
  name                         = "sqlserverminipro876811"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "StrongPassword@123"
}
