variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of resource groups to be created"
}

variable "app_service_plans" {
  type = map(object({
    name         = string
    sku_name     = string
    worker_count = number
    rg_key       = string
  }))
  description = "Map of App Service Plans"
}

variable "app_services" {
  type = map(object({
    name     = string
    rg_key   = string
    plan_key = string
  }))
  description = "Map of Windows Web Apps"
}

variable "traffic_manager_name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "verification_ip" {
  type        = string
  description = "IP address of the verification agent"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for resources"
}

variable "ip_restriction_name_ip" {
  type        = string
  description = "Name for the allow-ip restriction rule"
}

variable "ip_restriction_name_tm" {
  type        = string
  description = "Name for the allow-tm restriction rule"
}

variable "tm_routing_method" {
  type        = string
  description = "Routing method for Traffic Manager"
}