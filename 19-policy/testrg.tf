resource "azurerm_resource_group" "bad" {
  name     = "bad-rg"
  location = "Central US"
  #comment tags and RG will not be created
  tags = {
  department = "IT"
  project    = "Demo"
  }

}
