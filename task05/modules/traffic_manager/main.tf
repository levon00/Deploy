resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.rg_name
  tags                   = var.tags
  traffic_routing_method = var.routing_method


  dns_config {
    relative_name = var.name
    ttl           = 60
  }

  monitor_config {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoint" {
  for_each = var.endpoints

  name               = each.value.name
  profile_id         = azurerm_traffic_manager_profile.tm.id
  target_resource_id = each.value.target_resource_id
  weight             = 100
}