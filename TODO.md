# Todo List

- [ ] Set up auth for the Ops cluster
    - [x] Set up a light values file for helm chart
    - [x] Emit helm manifest for Authelia
    - [x] Break it down into individual pieces
    - [x] SealedSecrets the bits we need to
    - [x] Make sure the users configMap is in git-crypt
    - [ ] Make sure kustomize works and apply
    - [ ] IngressRoute with public IP

- [ ] Set up BitWarden as a remote secrets manager (SealedSecrets in cluster, BitWarden on VMs)
    - [ ] Work out how we inject secrets
    - [ ] API key stuff so we can access vault unattended

- [ ] Set up LiteLLM
    - [ ] Create basic set of manifests for deployment and secret
    - [ ] Add API key(s)

- [ ] Set up observability stack
    - [ ] Set up ClickHouse
        - [ ] Client and server?
    - [ ] Set up Fluentbit DaemonSet (probs just a helm chart?)
        - [ ] Kubernetes logs config
    - [ ] Install Grafana
        - [ ] Install ClickHouse datasource plugin
    - [ ] Set up Prometheus

- [ ] Set up another cluster on `big`
    - [ ] Linkerd so we can talk between clusters?