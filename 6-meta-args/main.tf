resource "azurerm_resource_group" "example" {
  name     = "mytestrg432426666dasda"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  for_each = var.storage_account_names
  name                     = each.key
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}