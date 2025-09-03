terraform {
  backend "azurerm" {
    resource_group_name  = "rg-nexgen-platform"
    storage_account_name = "stnexgenstate<random>"
    container_name       = "tfstate"
    key                  = "global.tfstate"
  }
}
