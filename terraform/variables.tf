variable "pm_api_token_id"         { sensitive = true }
variable "pm_api_token_secret"     { sensitive = true }
variable "pve_ssh_public_key"      { sensitive = false }
variable "homelab_ssh_public_key"  { sensitive = false }
variable "cloud_init_password"     { sensitive = true }