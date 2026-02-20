module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.common_tags
}

module "app_service_plans" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name         = each.value.name
  location     = module.resource_groups[each.value.rg_key].location
  rg_name      = module.resource_groups[each.value.rg_key].name
  sku_name     = each.value.sku_name
  worker_count = each.value.worker_count
  tags         = var.common_tags
}

module "app_services" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name            = each.value.name
  location        = module.resource_groups[each.value.rg_key].location
  rg_name         = module.resource_groups[each.value.rg_key].name
  service_plan_id = module.app_service_plans[each.value.plan_key].id
  verification_ip = var.verification_ip
  tags            = var.common_tags

  ip_restrictions = [
    {
      name        = var.ip_restriction_name_ip
      ip_address  = "${var.verification_ip}/32"
      service_tag = null
      priority    = 100
    },
    {
      name        = var.ip_restriction_name_tm
      ip_address  = null
      service_tag = "AzureTrafficManager"
      priority    = 110
    }
  ]
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name    = var.traffic_manager_name
  rg_name = module.resource_groups["rg3"].name
  tags    = var.common_tags

  endpoints = {
    for k, v in module.app_services : k => {
      name               = v.name
      target_resource_id = v.id
    }
  }
}