terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.111" # current at time of writing
    }
  }
}

provider "azurerm" {
  features {}
}
