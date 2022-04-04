resource "vault_kubernetes_auth_backend_role" "example" {
  for_each                         = toset(var.application) 
  backend                          = "kubernetes-arn:aws:eks:${var.aws_region}:${var.aws_account_id}:cluster/${var.environment}-cluster-eks-service/"
  role_name                        = each.value
  bound_service_account_names      = [var.bound_service_account_names]
  bound_service_account_namespaces = [each.value]
  token_ttl                        = var.token_ttl
  token_policies                   = [each.value]
}