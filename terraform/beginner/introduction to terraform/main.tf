resource "azurerm_resource_group" "demo1" {
  name     = "${var.name}" # name of the RG
  location = "${var.location}"

  tags = {
    "test" = "test1"
  }
}