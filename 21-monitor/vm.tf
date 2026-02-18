resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vmminipro343900"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_username = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("C:/Alan/MyWork/linuxvms/mykeys/key1.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  provisioner "remote-exec" {

  inline = [

    # wait for Azure cloud-init to finish
    "echo waiting for cloud-init...",
    "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do sleep 2; done",

    # install nginx
    "sudo apt-get update -y",
    "sudo apt-get install -y nginx",

    # create webpage
    "echo '<h1>Terraform Monitoring Lab Working</h1>' | sudo tee /var/www/html/index.html",

    # start service
    "sudo systemctl restart nginx",
    "sudo systemctl enable nginx"
  ]

    connection {
        type        = "ssh"
        user        = "azureuser"
        private_key = file("C:/Alan/MyWork/linuxvms/mykeys/key1")
        host        = azurerm_public_ip.pip.ip_address
    }
  }
}
