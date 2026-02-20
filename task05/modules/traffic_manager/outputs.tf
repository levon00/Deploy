output "fqdn" {
  value       = azurerm_traffic_manager_profile.tm.fqdn
  description = "The Fully Qualified Domain Name (FQDN) of the Azure Traffic Manager profile."
}