# EH Homelab

## Background
This is me learning plaform and having a play about in my homelab. Will get this linked to the internet once I have things secure. Right now, it's just me messing about with K3S.

## K3S Instructions

To get started, first launch a server node with the cluster-init flag to enable clustering and a token that will be used as a shared secret to join additional servers to the cluster.

```
curl -sfL https://get.k3s.io | sh -s - server \
    --cluster-init \
    --tls-san=<FIXED_IP> \ # Optional, needed if using a fixed registration address
    --disable servicelb # Optional, remove things we don't want i.e. serviceLB and maybe traefik
```

After launching the first server, join the second and third servers to the cluster using the shared secret:
(Get the shared secret by catting out /var/lib/rancher/k3s/server/token on the first box)

```
curl -sfL https://get.k3s.io | K3S_TOKEN=[SECRET] sh -s - server \
    --server https://<ip or hostname of server1>:6443 \
    --tls-san=<FIXED_IP> \ # Optional, needed if using a fixed registration address
    --disable servicelb # Optional, remove things we don't want i.e. serviceLB and maybe traefik
```

Check to see that the second and third servers are now part of the cluster:

```
$ kubectl get nodes
NAME        STATUS   ROLES                       AGE   VERSION
server1     Ready    control-plane,etcd,master   28m   vX.Y.Z
server2     Ready    control-plane,etcd,master   13m   vX.Y.Z
server3     Ready    control-plane,etcd,master   10m   vX.Y.Z
```

Join the workers to the cluster:

```
curl -sfL https://get.k3s.io | K3S_TOKEN=[SECRET] sh -s - agent --server https://<ip or hostname of server>:6443
```

N.B. there's no need to set a san here as the HA ETCD will push updates across the control plane.
N.B. Can also use the single registration point if that's set up on the edge load balancer. Not required though