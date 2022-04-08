resource "vault_kubernetes_auth_backend_role" "role" {
  for_each                         = toset(var.application) 
  backend                          = var.k8s_path
  role_name                        = each.value
  bound_service_account_names      = [var.bound_service_account_names]
  bound_service_account_namespaces = [each.value]
  token_ttl                        = var.token_ttl
  token_policies                   = [vault_policy.policy[0].name]
}