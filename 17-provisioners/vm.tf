resource "azurerm_linux_virtual_machine" "vm" {

  name                  = "vmminipro232333"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_D2s_v3"

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

  #local exec provisioner // uncomment below line to test VM standalone
  depends_on = [ null_resource.deployment_prep ]

  # ================= STEP 4 START : Adding remote exec provisioner =================

    provisioner "remote-exec" {

    inline = [

        # WAIT for cloud-init to finish
        "echo waiting for cloud-init...",
        "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do sleep 2; done",

        "sudo apt-get update -y",

        # Install nginx
        "sudo apt-get install -y nginx",

        # Create web page
        "echo '<html><body><h1>Terraform Provisioner Demo Working!</h1></body></html>' | sudo tee /var/www/html/index.html",

        # Start nginx
        "sudo systemctl restart nginx",
        "sudo systemctl enable nginx"
    ]

    connection {
        type        = "ssh"
        user        = "azureuser"
        private_key = file("C:/Alan/MyWork/linuxvms/mykeys/key1")
        host        = azurerm_public_ip.pubip.ip_address
    }
    }


  # ================= STEP 4 END =================

  # ================= STEP 5 START : File Provisioner =================

  provisioner "file" {

    source      = "configs/sample.conf"
    destination = "/home/azureuser/sample.conf"

    connection {
        type        = "ssh"
        user        = "azureuser"
        private_key = file("C:/Alan/MyWork/linuxvms/mykeys/key1")
        host        = azurerm_public_ip.pubip.ip_address
    }
  }

  # ================= STEP 5 END =================

}

output "vm_public_ip" {
  value = azurerm_public_ip.pubip.ip_address
}
