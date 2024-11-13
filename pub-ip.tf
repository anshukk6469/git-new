resource "azurerm_resource_group" "example" {
  name     = "Count-deep"
  location = "eastus"
  tags = {
    env = "prod"
  }
}

resource "azurerm_public_ip" "example" {
  name                = "Deep-IP${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  count = 5
  tags = {
    environment = "Production"
  }
}
