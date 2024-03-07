output "VAULT_ADDR" {
  value = var.vault_server_url
  sensitive = true
}

output "VAULT_NAMESPACE" {
  value = "admin"
  sensitive = true
}

output "vault_server_url" {
  value = var.vault_server_url
  sensitive = false
}

output "vault_secret_path" {
  value = vault_kv_secret_v2.taco.path
  sensitive = false
}

output "vault_role" {
  value = vault_jwt_auth_backend_role.example.role_name
  sensitive = false
}