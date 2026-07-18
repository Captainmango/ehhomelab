# AGENTS.md

Personal homelab infrastructure. Two Kubernetes clusters (k3s + k0s), a standalone Traefik reverse proxy, a Proxmox Terraform setup.

```IMPORTANT
NEVER APPLY KUSTOMIZE. ALWAYS ASK THE USER TO DO THIS.
ALWAYS ASK THE USER TO RUNE KUBECTL OR ANY K8S RELATED COMMANDS AND PROVIDE THE OUTPUT.
```

## Repo layout

- `k3s/` — k3s cluster manifests and Helm values (LEGACY).
- `k0s/` — k0s cluster managed with `k0sctl` (`k0s/cluster/k0s-cluster.yaml`).
- `traefik/` — **external** standalone Traefik instance (VM), not the in-cluster one. Fronts Proxmox, pfSense, k0s ingress, FoundryVTT, etc.
- `terraform/` — Proxmox VM template via `bpg/proxmox`.
- `foundryvtt/` — systemd unit for the FoundryVTT VM.
- `test-stuff/` — scratch Kustomize examples.
- `mcp/` — experimental Crossplane MCP resources.

## File encoding gotcha

Several files are saved as **UTF-16 LE** or with a **UTF-8 BOM**. Standard editors/tools may corrupt them.

- UTF-16 LE: `k0s/cluster/certmanager-sealed-secret.yaml`, `k0s/manifests/*/values.yaml`, `k3s/manifests/*/sealed-*.yaml`, `k3s/manifests/woodpeckerci/gh-sealedsecret.yaml`.
- UTF-8 BOM: `k0s/manifests/authelia/kustomize/base/resources/sealed-*.yaml`, `k0s/manifests/litellm/kustomize/**/secrets/*.yaml`.

Check before editing: `file <path>`. Preserve the original encoding/BOM when saving.

## Secrets

- Cluster secrets are **SealedSecrets** (`bitnami.com/v1alpha1`). Sealing key is not in the repo (kept separately as `sealed-secrets.pem`, which is `.gitignore`d).
- Some source secrets are encrypted with **git-crypt**; see `.gitattributes`.
  - Currently tracked: `k3s/manifests/authelia/authelia-users-configMap.yml`.
  - Note: the `.gitattributes` path for `k0s/.../migrations-job.yaml` is stale (actual path is under `kustomize/main/base/jobs/`).
- Terraform needs a `terraform/terraform.tfvars` file (not in repo) with Proxmox API token and SSH keys; see `terraform/variables.tf`.

## Deploying applications

No CI, tests, or task runner — apply manually. Preferred patterns:

- **k0s**: most apps are plain Kustomize. Apply via `kubectl apply -k <dir>`.
  - LiteLLM: Postgres must come up first, then the main app.
    ```bash
    kubectl apply -k k0s/manifests/litellm/kustomize/pg/base
    kubectl apply -k k0s/manifests/litellm/kustomize/main/base
    ```
  - Open WebUI: Redis must come up first, then the main app.
    ```bash
    kubectl apply -k k0s/manifests/open-webui/kustomize/redis/base
    kubectl apply -k k0s/manifests/open-webui/kustomize/main/base
    ```
  - Traefik itself is installed by k0s via Helm (`k0s/cluster/cluster-config.yaml`, chart version pinned there). `k0s/manifests/traefik/` adds IngressRoutes, Certificates, Middleware, and the default TLSStore for that in-cluster Traefik.
- **k3s** (LEGACY DO NOT UPDATE): apps are generally Helm values files plus raw manifests.
  - `k3s/config.yaml` disables `servicelb` and taints the control plane; MetalLB provides the `LoadBalancer` IPs (`k3s/manifests/metallb/`).
  - Woodpecker: the chart is not vendored in the repo; README says it must be pulled locally. GitHub OAuth secrets are mounted as files (`/secrets/gh/client_id.txt`, `/secrets/gh/client_secret.txt`), not env vars.
- **FoundryVTT**: copy `foundryvtt/foundryvtt.service` to the VM and enable it. Runs from `/opt/foundry/resources/app/main.js` with data in `/home/ubuntu/foundry-data`.

## Cluster network ranges

- k0s: `192.168.100.0/24`; MetalLB pool `192.168.100.150-192.168.100.250`.
- k3s: `192.168.1.0/24`; MetalLB pool `192.168.1.1-192.168.1.49`.
- External domain: `eheaver.cloud` (Cloudflare DNS + Let's Encrypt via DNS-01).

## Terraform

- Provider: `bpg/proxmox`.
- Creates a Proxmox VM template (`ubuntu-cloud`, VM ID 1000) on node `pve`.
- Requires `terraform/terraform.tfvars` with sensitive Proxmox credentials.
- No remote backend configured; state is local by default.

## Common mistakes to avoid

- Do not assume plain UTF-8 for YAML files — verify encoding first.
- Do not commit raw secrets. Use SealedSecrets or git-crypt.
- Do not apply litellm/open-webui main resources before their dependent datastore is running.
- The external `traefik/` config is a separate service. Do not edit `k0s/manifests/traefik/` ever.
