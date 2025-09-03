resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "pg-${var.env}-nexgen"
  resource_group_name    = var.resourcegrp
  location               = var.location
  version                = "16"
  administrator_login    = var.admin_user
  administrator_password = var.admin_pass
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
  zone                   = "1"
}

resource "azurerm_postgresql_flexible_server_database" "appdb" {
  name      = "nexgendb"
  server_id = azurerm_postgresql_flexible_server.db.id
  charset   = "UTF8"
  collation = "en_US.UTF8"
}
