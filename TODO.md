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

- [ ] Improve Open WebUI set up
    - [ ] Add image gen (BlackForest Labs)
    - [ ] Add video gen (MiniMax and others)
    - [ ] Set up some better search tools (Tivally sucks tbh)
    - [ ] Functions and other Extensions (Code Sandbox, custom UI stuff)
    - [ ] Can we get it to accept images over the wire?
    - [ ] Might want to add DeepSeek and Mistral models for general purpose use (MiniMax and Kimi are very good at code, but also very expensive for general use.)

- [x] Redo networking to use VLANs
    - [x] Move internal LAN bridge to VLAN (pfsense handles DHCP)
    - [x] Move DMZ bridge to VLAN (pfsense handles DHCP)
    - [x] Do some more tidying up maybe?

- [x] Firewall stuff
    - [x] Make sure DMZ cannot nat past gateway (probs needs a static route)
    - [x] Block all traffic except towards gateway on DMZ
        - [x] External traffic is fine. Just anything going to other places

- [ ] Set up backups using Restic
    - [ ] Figure out Restic config for Hetzner bucket
    - [ ] Backup foundry VM
        - [ ] SystemD unit
        - [ ] Cron scheduled to run every week
    - [ ] Set up backups for k8s cluster private volumes
        - [ ] Restic + Velero?
        - [ ] Backup cert chain for sealedsecrets controller
        - [ ] Backup Grafana stuff
            - [ ] Needs a PVC
            - [ ]

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
    - [ ] Ingress route to vlsingle
    - [ ] ExternalWorkload resources from VictoriaMetrics?
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
    - [ ] 1 Controller, 1 worker. Add new workers when we need to via k0sctl
    - [ ] Work out context situation (Manually set the context name locally. If we have multiple, we'll need to sort that out and name them appropriately. Controller should know what the name is really.)
    - [ ] Linkerd so we can talk between clusters?