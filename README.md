# EH Homelab

## Background
This is me learning plaform and having a play about in my homelab. Will get this linked to the internet once I have things secure. Right now, it's just me messing about with binary distros of Kubernetes.

## Running services
- FoundryVTT


## Secrets
This repo has two secret strategies:

### Sealed Secrets

```
# Create a json/yaml-encoded Secret somehow:
# (note use of `--dry-run` - this is just a local file!)
echo -n bar | kubectl create secret generic mysecret --dry-run=client --from-file=foo=/dev/stdin -o json >mysecret.json

# This is the important bit:
kubeseal -f mysecret.json -w mysealedsecret.json

# At this point mysealedsecret.json is safe to upload to Github,
# post on Twitter, etc.

# Eventually:
kubectl create -f mysealedsecret.json
```

### GitCrypt
Add the path to the `.gitattributes` with the correct filter and ensure it filters it out.

The Key is in my password vault.