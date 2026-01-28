variable "prefix" {
  default = "tfvmex"
}

variable "storage_disk_size" {
  type = number
  description = "size of storage disk"
  default = 80
}

variable "is_disk_delete" {
  type = bool
  description = "delete the OS disk automatically when deleting the VM"
  default = true
}

variable "allowed_locations" {
  type = list(string)
  description = "allowed locations for the creation of resources"
  default = [ "West Europe", "East Europe", "East US" ]
  
}

variable "allowed_tags" {
  type = map(string)
  description = "allowed tags for resources"
  default = {
    "environment" = "staging"
    "department" = "devops"
  }
  
}

variable "my_network_config" {
  type = tuple([ string, string, number, bool ])
  description = "VNet address, subnet address, subnet mask, a test flag"
  default = [ "10.0.0.0/16", "10.0.2.0/24", 24, true ]
  
}

variable "allowed_vm_sizes" {
  type = set(string)
  description = "allowed VM sizes"
  default = [ "Standard_DS1_v2", "Standard_DS2_v2" ]
  
}

variable "vm_config" {
  type = object({
    size = string
    publisher = string
    offer = string
    sku = string
    version = string
  })
  description = "VM Configuration"
  default = {
    size = "Standard_DS1_v2"
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
  
}