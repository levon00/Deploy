resource "azurerm_windows_web_app" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    ip_restriction_default_action = "Deny"

    ip_restriction {
      name       = "allow-ip"
      ip_address = "${var.verification_ip}/32"
      priority   = 100
      action     = "Allow"
    }

    ip_restriction {
      name        = "allow-tm"
      service_tag = "AzureTrafficManager"
      priority    = 110
      action      = "Allow"
    }
  }
}