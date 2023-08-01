# pingweb_exporter
Prometheus exporter for checking the health of web over HTTP request.

### Config
Targets ```system/services.json``` can be specified in a Json based config:
```
[
  {
    "name": "serviceA",
    "url": "https://yourservice-A.domain/ping"
  },
  {
    "name": "serviceB",
    "url": "https://yourservie-B.domain/ping"
  }
]

```

### Build
```
docker build -t airfansyah/pingweb-exporter .
docker push airfansyah/pingweb-exporter
```

### Deployment
```
kubectl create ns exporters
kubectl create secret generic pingweb-services --from-file=system/services.json  -n exporters
kubectl apply -f deploy.yaml -n exporters
```
