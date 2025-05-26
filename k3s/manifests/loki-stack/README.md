# Loki (logging)

Use the loki stack helm chart but with Loki turned off (the values file has this). This is so we get Promtail set up to forward logs to Loki. Will need to delete the secret it makes. We are going to recreate using the sealed secret.

Use the regular Loki chart with the respecitve values file to install Minio and Loki. The gateway is how we access Loki with this approach. This is so that if we decide to scale up, the gateway handles routing. This is handled by Nginx and is pre configured.

Loki-stack promtail relies on a secret called `loki-promtail` so make sure it's named right when setting it up.


## Amending the secret

cd to where the promtail.yaml is for an easy life.

N.B. whatever namespace you're on when you call kubeseal is the one it will make the secret in. MAKE SURE YOU'RE IN THE RIGHT PLACE.

Maybe break up the commands for an easy life.

```
kubectl create secret generic loki-promtail --dry-run=client --from-file=promtail.yaml=promtail.yaml -o yaml | kubeseal --cert ../../../sealed-secrets.pem --format yaml > sealedsecret.yaml
```

Powershell just in case
```
kubectl create secret generic loki-promtail --dry-run=client --from-file=promtail.yaml=promtail.yaml -o yaml | kubeseal --cert ../../../sealed-secrets.pem --format yaml | Out-File sealedsecret.yaml
```

