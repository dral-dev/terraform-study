resource "azurerm_policy_definition" "tagpolicy" {

  name         = "allowed-tag"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed tags policy"

  policy_rule = jsonencode({
    if = {
      anyOf = [
        {
          field  = "tags[${var.allowed_tags[0]}]"
          exists = false
        },
        {
          field  = "tags[${var.allowed_tags[1]}]"
          exists = false
        }
      ]
    }

    then = {
      effect = "deny"
    }
  })
}


resource "azurerm_subscription_policy_assignment" "tag_assign" {

  name = "tag-assignment"

  policy_definition_id = azurerm_policy_definition.tagpolicy.id

  subscription_id = data.azurerm_subscription.subscriptioncurrent.id
}
