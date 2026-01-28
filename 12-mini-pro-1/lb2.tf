resource "azurerm_lb_probe" "lbprobe" {
  name            = "httplbprobeminipro98989"
  loadbalancer_id = azurerm_lb.lb.id
  protocol        = "Http"
  port            = 80
  request_path    = "/"
}

resource "azurerm_lb_rule" "lbrule" {
  name                           = "httplbruleminipro567565"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontendipforlbminipro32323"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpool.id]
  probe_id                       = azurerm_lb_probe.lbprobe.id
}

