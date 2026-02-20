resource_groups = {
  rg1 = { name = "cmaz-0sj5vwga-mod5-rg-01", location = "East US" }
  rg2 = { name = "cmaz-0sj5vwga-mod5-rg-02", location = "West US" }
  rg3 = { name = "cmaz-0sj5vwga-mod5-rg-03", location = "North Europe" }
}

app_service_plans = {
  asp1 = {
    name         = "cmaz-0sj5vwga-mod5-asp-01"
    sku_name     = "S1"
    worker_count = 2
    rg_key       = "rg1"
  }
  asp2 = {
    name         = "cmaz-0sj5vwga-mod5-asp-02"
    sku_name     = "S1"
    worker_count = 1
    rg_key       = "rg2"
  }
}

app_services = {
  app1 = {
    name     = "cmaz-0sj5vwga-mod5-app-01"
    rg_key   = "rg1"
    plan_key = "asp1"
  }
  app2 = {
    name     = "cmaz-0sj5vwga-mod5-app-02"
    rg_key   = "rg2"
    plan_key = "asp2"
  }
}

traffic_manager_name = "cmaz-0sj5vwga-mod5-traf"
verification_ip      = "18.153.146.156"
common_tags          = { Creator = "levon_khalatyan@epam.com" }