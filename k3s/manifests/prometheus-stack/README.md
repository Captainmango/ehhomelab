# Prometheus Stack

Use the prometheus community helm charts with kube-prometheus-stack chart.

```
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace -f values.yaml
```

This will set up loadbalancers for the pieces we care about. Check these come up and add them to the traefik config as required.

N.B. make sure we use the right ports (values already has these set up.)
