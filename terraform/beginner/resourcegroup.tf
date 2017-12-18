resource "azurerm_resource_group" "demo" {
    name = "bitpro"
    location = "SouthIndia"
    tags {
      name = "demo"
    }
}