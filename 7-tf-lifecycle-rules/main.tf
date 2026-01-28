resource "azurerm_resource_group" "example" {
  name     = "rgtmh01jiooo900"
  location = "West Europe"
}

resource "null_resource" "a_null_resource" {
  triggers = {
    version = "v2"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "satmh01jiooo900newname2"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }

  #uncomment below block to test: create_before_destroy
    /*
  lifecycle {
    create_before_destroy = true
    }
    */


    #uncomment below block to test: ignore_changes
    /*
    lifecycle {
      ignore_changes = [ tags ]
    }
    */


    #uncomment below block to test: prevent_destroy
    /*
    lifecycle {
      prevent_destroy = true
    }
    */


    #uncomment below block to test: replace_triggered_by
    /*
        lifecycle {
          replace_triggered_by = [ null_resource.a_null_resource ]
        }
        */

}


