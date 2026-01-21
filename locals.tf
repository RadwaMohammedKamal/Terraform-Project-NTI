locals {
  environment    = var.environment
  region         = var.region
  project_name   = var.project_name
  owner          = var.owner

  instance_type  = lookup(var.instance_type_map, var.environment)
  instance_count = var.base_instance_count
  allowed_ports  = lookup(var.allowed_ports_map, var.environment)

  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    Owner       = local.owner
  }
}
