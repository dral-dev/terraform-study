resource "azurerm_lb" "lb" {
  name                = "lbminipro32323"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontendipforlbminipro32323"
    public_ip_address_id = azurerm_public_ip.pubip.id
  }
}


resource "azurerm_lb_backend_address_pool" "bpool" {
  name            = "backendpoolminipro323232"
  loadbalancer_id = azurerm_lb.lb.id
}
