# LiteLLM

My set up is decomposed from the Helm chart so I have more control. It's a bit Jank, but there's a reason...

> N.B. this is not for production use. If it were, we'd need 'real' Postgres in the cloud somewhere

## Step 1 - PG

Bring Postgres up first

```
kubectl apply -k ./k0s/manifests/litellm/kustomize/pg/base
```

This will start the database, create a PVC, and run the migrations against it.


## Step 2 - Main

Once the database is running, bring up the main application

```
kubectl apply -k ./k0s/manifests/litellm/kustomize/main/base
```

Tail logs to make sure it boots correctly and starts heartbeating

```
kubectl logs -f [w/e the pod is called]
```