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

- [x] Set up Open WebUI
    - [x] Create manifests
    - [x] Split Redis out so we can apply it first
    - [x] Ingress route so we can access (no auth and force https with cert)
    - [x] Set up integration with litellm proxy
    - [x] Pray lol (https://github.com/BerriAI/litellm/issues/15950)

- [ ] Redo networking to use VLANs
    - [ ] Move internal LAN bridge to VLAN (pfsense handles DHCP)
    - [ ] Move DMZ bridge to VLAN (pfsense handles DHCP)
    - [ ] Do some more tidying up maybe?

- [ ] Firewall stuff
    - [ ] Make sure DMZ cannot nat past gateway (probs needs a static route)
    - [ ] Block all traffic except towards gateway on DMZ

- [x] Set up observability stack (For K8s)
    - [x] Set up VictoriaMetrics
        - [x] Install the Kubeoperator and make sure it has a public IP + ingress
        - [x] Create the VMSingle resource (make sure it's a Daemonset)
    - [x] Set up VictoriaLogs
        - [x] Set up Fluentbit DaemonSet (probs just a helm chart?)
        - [x] Set up vlagent to pull logs?
        - [x] Kubernetes logs config
    - [x] Install Grafana
        - [x] Set up datasource

- [ ] Set up observability stack for vms
    - [ ] Set up Fluentbit on VMs
        - [ ] Create a config that exports from SystemD
        - [ ] Metrics like CPU and mem usage too?
    - [ ] Export metrics from VM
        - [ ] Node exporter?
        - [ ] VM Agent?

- [x] Set up homepage
    - [x] Set up Kustomize
    - [x] Install and configure widgets
        - [x] Prometheus
        - [x] Grafana
        - [x] Traefik? (Ingress and gateway)

- [ ] Set up another cluster on `big`
    - [ ] Linkerd so we can talk between clusters?