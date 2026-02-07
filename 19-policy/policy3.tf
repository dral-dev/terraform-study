resource "azurerm_policy_definition" "location" {

  name         = "location"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed location policy"

  policy_rule = jsonencode({
    if = {
      field = "location"

      notIn = [
        var.location[0],
        var.location[1]
      ]
    }

    then = {
      effect = "deny"
    }
  })
}


resource "azurerm_subscription_policy_assignment" "loc_assign" {

  name = "location-assignment"

  policy_definition_id = azurerm_policy_definition.location.id

  subscription_id = data.azurerm_subscription.subscriptioncurrent.id
}
