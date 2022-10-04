resource "vault_policy" "policy" {
  for_each = toset(var.application)
  name = join("-", [each.value, var.environment]) 

  policy = <<EOT
path "${var.environment}/*" {
  capabilities = ["list"]
}

path "${var.environment}/data/default" {
  capabilities = ["list", "read"]
}

path "${var.environment}/data/${each.value}" {
  capabilities = ["list", "read"]
}

path "${var.environment}/data/redis/${each.value}" {
  capabilities = ["list", "read"]
}

path "${var.environment}/data/mongodb_atlas/${each.value}" {
  capabilities = ["list", "read"]
}

EOT
}

