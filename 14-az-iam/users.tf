
#Uncomment below block to test adding 1 user; change attributes as needed; keep domain name same as yours
/*
resource "azuread_user" "testuserminipro867" {
  user_principal_name = "testuserminipro867@alanfba004gmail.onmicrosoft.com"
  display_name = "Test Userminipro867 "
  password = "Password123!"
}
*/



locals {
  upns = [
    for u in local.users :
    lower("${u.first_name}.${u.last_name}@${data.azuread_domains.tenant.domains[0].domain_name}")
  ]
}

output "duplicate_check" {
  value = length(local.upns) != length(distinct(local.upns)) ? "❌ DUPLICATES FOUND" : "✅ No duplicates"
}


output "planned_users" {
  value = local.upns
}


resource "azuread_user" "users" {

  for_each = {
    for idx, user in local.users :
    local.upns[idx] => user
  }

  user_principal_name = each.key
  display_name        = "${each.value.first_name} ${each.value.last_name}"

  mail_nickname = lower("${each.value.first_name}${each.value.last_name}")
  department = each.value.department   # 👈 ADD THIS IF YOU NEED TO USE THIS VALUE FOR GROUPING USERS

  password = "Password123!"
}
