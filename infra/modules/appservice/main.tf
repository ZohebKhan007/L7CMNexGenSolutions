resource "azurerm_service_plan" "plan" {
  name                = "asp-nexgen-${var.env}"
  resource_group_name = var.resourcegrp
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "web-nexgen-${var.env}"
  resource_group_name = var.resourcegrp
  location            = var.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    linux_fx_version = "PYTHON|3.11"
  }

  app_settings = merge({
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
    "WEBSITE_RUN_FROM_PACKAGE"       = "1"
  }, var.app_settings)
}
