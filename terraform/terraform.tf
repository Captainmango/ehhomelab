terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.109"
    }
  }
  
  required_version = "~> 1.15"
}

provider "proxmox" {
  endpoint  = "https://proxmox.eheaver.cloud"
  username  = var.pm_api_token_id
  api_token = var.pm_api_token_secret
  insecure  = false
}
