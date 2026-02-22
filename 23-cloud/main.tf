terraform {
  cloud {
    organization = "tmhtforg"

    workspaces {
      name = "cli-lab"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = "rg-hcp-test-001"
  location = "Central US"
}
