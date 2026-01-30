resource "azurerm_web_app_active_slot" "swap" {
  slot_id = azurerm_app_service_slot.slot.id
}
