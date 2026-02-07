resource "azurerm_policy_definition" "vm_size" {

  name         = "vm-size"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed vm policy"

  policy_rule = jsonencode({
    if = {
      field = "Microsoft.Compute/virtualMachines/sku.name"

      notIn = [
        var.vm_sizes[0],
        var.vm_sizes[1]
      ]
    }

    then = {
      effect = "deny"
    }
  })
}

resource "azurerm_subscription_policy_assignment" "vm_assign" {

  name = "size-assignment"

  policy_definition_id = azurerm_policy_definition.vm_size.id

  subscription_id = data.azurerm_subscription.subscriptioncurrent.id
}
