resource "azurerm_mssql_database" "sqldb" {
  name      = "sqldbminipro81829"
  server_id = azurerm_mssql_server.sql_server.id
}
