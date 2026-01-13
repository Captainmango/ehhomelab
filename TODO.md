# Todo List

- [x] Set up auth for the Ops cluster
    - [x] Set up a light values file for helm chart
    - [x] Emit helm manifest for Authelia
    - [x] Break it down into individual pieces
    - [x] SealedSecrets the bits we need to
    - [x] Make sure the users configMap is in git-crypt
    - [x] Make sure kustomize works and apply

- [ ] Set up BitWarden as a remote secrets manager (SealedSecrets in cluster, BitWarden on VMs)
    - [ ] Work out how we inject secrets
    - [ ] API key stuff so we can access vault unattended

- [x] Set up LiteLLM
    - [x] Create basic set of manifests for deployment and secret
    - [x] Split the postgres and application manifests. 
            Postgres has to be first and there's an issue with the volume claim
    - [x] Ingress route (no auth and force https. probs needs a cert too?)
    - [x] Add API key(s)

- [ ] Set up Open WebUI
    - [x] Create manifests
    - [x] Split Redis out so we can apply it first
    - [ ] Ingress route so we can access (no auth and force https with cert)
    - [ ] Set up integration with litellm proxy
    - [ ] Pray

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