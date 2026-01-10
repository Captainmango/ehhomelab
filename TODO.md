# Todo List

- [ ] Set up auth for the Ops cluster
    - [ ] Set up a light values file for helm chart
    - [ ] Emit helm manifest for Authelia
    - [ ] Break it down into individual pieces
    - [ ] SealedSecrets the bits we need to
    - [ ] Make sure the users configMap is in git-crypt
    - [ ] IngressRoute with public IP

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