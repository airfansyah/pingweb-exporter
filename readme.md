# pingweb_exporter
Prometheus exporter for checking the health of web over HTTP request.

### Build
```
docker build -t airfansyah/pingweb-exporter .
docker push airfansyah/pingweb-exporter
```

### Deployment
```
kubectl create ns exporters
kubectl create secret generic pingweb-services --from-file=../system/services.json  -n exporters
kubectl apply -f deploy.yaml -n exporters
```
