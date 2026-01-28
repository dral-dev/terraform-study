resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example" {
  name                = var.environment == "dev"? "mytestnsg10001dev": "mytestnsg10001test"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  dynamic "security_rule" {
    for_each = local.nsg_rules
    content {
      name = security_rule.key
      priority = security_rule.value.priority
      destination_port_range = security_rule.value.destination_port_range
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    
  }

  tags = {
    environment = "Production"
  }
}