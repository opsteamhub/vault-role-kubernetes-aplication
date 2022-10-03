resource "vault_policy" "policy" {
  for_each = toset(var.application)
  name = join("-", [each.value, var.environment]) 

  policy = <<EOT
path "${var.environment}/*" {
  capabilities = ["list"]
}

path "${var.environment}/data/${each.value}" {
  capabilities = ["list", "read"]
}

path "${var.environment}/data/redis" {
  capabilities = ["list", "read"]
}
path "${var.environment}/data/mongodb_atlas" {
  capabilities = ["list", "read"]
}

EOT
}

