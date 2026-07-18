# Victoria Metrics

Used for observability.

Template everything out

```
helm repo add vm https://victoriametrics.github.io/helm-charts/
helm show values vm/victoria-metrics-k8s-stack > values.yaml
helm template vm-operator vm/victoria-metrics-k8s-stack -f ./k0s/manifests/victoria-metrics/values.yaml -n monitoring --create-namespace
```
Configure the bad boys and apply (Should already be a kustomize here though)