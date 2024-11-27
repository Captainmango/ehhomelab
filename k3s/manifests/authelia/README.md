# Authelia

Install using the Helm chart and the values file here (this sets things up for local storage and runs in a StatefulSet)

The local set up needed some extra mounts so it could read the database. Otherwise it crashloops.

Add users to the thing by editing the config map. 

Also set up the SMTP by editing the config map. It's more work, but saves me the effort of going through Kustomize and setting up git-crypt for this.

## Todo List
- [x] Add SMTP settings (just do manual edit of the secret)
- [ ] Turn on TOTP and two_factor