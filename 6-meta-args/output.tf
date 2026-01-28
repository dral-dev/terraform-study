output "created_storage_account_names" {
  value = [for sa in azurerm_storage_account.example: sa.name]
}