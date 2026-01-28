/*
Creating a data source for virtual network and realted respouece group; that we already have in the portal;
The VM will be using this virtual network and will not be creating its own
*/
data "azurerm_resource_group" "rgforvnetsharedfromazportal7698" {
  name = "rgsharedvnet909999" #this should be same as the one existing in the azure portal
}

data "azurerm_virtual_network" "vnetfromazportal7868" {
  name = "vnetsharedvnet67687" #this should be same as the one existing in the azure portal
  resource_group_name = data.azurerm_resource_group.rgforvnetsharedfromazportal7698.name
}

data "azurerm_subnet" "subnetfromazportal3333" {
    name = "subnetdefault" #this should be same as the one existing in the azure portal
    virtual_network_name = data.azurerm_virtual_network.vnetfromazportal7868.name
    resource_group_name = data.azurerm_resource_group.rgforvnetsharedfromazportal7698.name
  
}