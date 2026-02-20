variable "routing_method" {
  type        = string
  description = "The traffic routing method for the Traffic Manager profile (e.g., Performance, Weighted, etc.)."
}

# Keep your existing variables below:
variable "name" {
  type        = string
  description = "The name of the Traffic Manager profile."
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group where the Traffic Manager profile will be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the Traffic Manager profile."
}

variable "endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string
  }))
  description = "A map of Azure App Service endpoints to be registered with the Traffic Manager profile."
}