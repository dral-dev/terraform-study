resource "azuread_group" "test_group" {
  display_name     = "Test Groupminpro1212"
  security_enabled = true
}


resource "azuread_group_member" "education" {

  for_each = {
    for u in azuread_user.users :
    u.mail_nickname => u
    if u.department == "Education"
  }

  group_object_id  = azuread_group.test_group.id
  member_object_id = each.value.id
}
