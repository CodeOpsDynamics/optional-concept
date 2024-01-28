resource "azurerm_resource_group" "rgconnect" {
  name     = "terrarg1"
  location = "West Europe"
}


resource "azurerm_virtual_network" "vnconnect" {
  for_each            = var.vn
  name                = each.value.name
  location            = azurerm_resource_group.rgconnect.location
  resource_group_name = azurerm_resource_group.rgconnect.name
  address_space       = each.value.as


  dynamic "subnet" {
    for_each       = each.value.subnets != null ? each.value.subnets : {}
    content {
    name           = subnet.value.sn
    address_prefix = subnet.value.ap
  }
  }

  tags = {
    environment = each.value.tg
  }
}