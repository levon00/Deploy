output "id" {
  value       = azurerm_windows_web_app.app.id
  description = "The resource ID of the Windows Web App."
}

output "name" {
  value       = azurerm_windows_web_app.app.name
  description = "The name of the Windows Web App."
}