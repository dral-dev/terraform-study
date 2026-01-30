data "azuread_domains" "tenant" {
  only_initial = true
}

output "domain" {
  value = data.azuread_domains.tenant.domains.0.domain_name
}
