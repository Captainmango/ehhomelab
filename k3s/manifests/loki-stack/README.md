# Loki (logging)

Use the Loki-stack helm chart in Grafana.

This installs the basics. We need to move to Alloy though as that is better supported plus handles all Otel stuff.

Setting up the datasource is simple, but there might be a little bug. Basically, use the DNS name the cluster gives it then back out if it errors. The DNS look up works for sure.