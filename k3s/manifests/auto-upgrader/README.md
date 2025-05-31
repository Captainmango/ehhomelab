# Unattended upgrades

Switch to the system-upgrade namespace. Apply the control-plane-plan first, and watch it go.

```
kubens system-upgrade
```
```
kubectl apply -f <path to manifest>
```

Once done, apply the worker plan in the same way. Once all nodes are back up, remove the plans.

It is possible to leave these on, but then upgrades will happen automatically causing some issues with workloads potentially. **It's always better to observe upgrades**