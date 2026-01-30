locals {
  users = csvdecode(file("users.csv"))
}

output "users_debug" {
  value = local.users
}
