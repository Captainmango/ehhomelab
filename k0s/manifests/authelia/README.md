# Authelia for K0s

Use Helm to template then split down into a kustomize.

Apply the kustomize rather than Helm chart as the chart does a lot of config stuff and is quite noisy.