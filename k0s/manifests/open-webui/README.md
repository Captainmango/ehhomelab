# Open WebUI

Create namespace then apply the kustomize inside it. Create new overlays as needed. All resources are what is required.

> N.B. this is not for production use. If it were, we'd need 'real' redis in the cloud somewhere

## Step 1 - Redis

Bring Postgres up first

```
kubectl apply -k ./k0s/manifests/open-webui/kustomize/redis/base
```

This will start the cache, and create a PVC.


## Step 2 - Main

Once the cache is running, bring up the main application

```
kubectl apply -k ./k0s/manifests/open-webui/kustomize/main/base
```

Tail logs to make sure it boots correctly and starts heartbeating

```
kubectl logs -f [w/e the pod is called]