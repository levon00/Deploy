output "name" {
  value       = azurerm_resource_group.rg.name
  description = "Then name of resource_group"
}
output "location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of resource group"
}