variable "name" {
  type        = string
  description = "The name of the Windows Web App."
}

variable "location" {
  type        = string
  description = "The Azure region where the Windows Web App will be created."
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Windows Web App."
}

variable "service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan that will host this Windows Web App."
}

variable "verification_ip" {
  type        = string
  description = "The IP address of the verification agent allowed to access the App Service (used in IP restrictions)."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the Windows Web App resource."
}