resource "azurerm_mssql_firewall_rule" "firewall_rule" {
  name             = "sqlfirewallruleminipro909122"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = ""
  end_ip_address   = ""
}
