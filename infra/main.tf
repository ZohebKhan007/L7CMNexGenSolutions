locals {
  rg_name = "rg-${var.project}-${var.env}"
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

module "postgres" {
  source       = "./modules/postgres"
  env          = var.env
  location     = var.location
  resourcegrp  = azurerm_resource_group.rg.name
  admin_user   = var.sql_admin_user
  admin_pass   = var.sql_admin_pass
}

module "appservice" {
  source          = "./modules/appservice"
  env             = var.env
  location        = var.location
  resourcegrp     = azurerm_resource_group.rg.name
  app_settings    = {
    "DJANGO_SECRET_KEY" = var.django_secret
    # DB connection will be added after postgres outputs exist
  }
  depends_on = [module.postgres]
}
