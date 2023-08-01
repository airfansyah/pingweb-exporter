#!/bin/sh
kubectl create secret generic pingweb-services --from-file=../system/services.json  -n exporters
kubectl apply -f deploy.yaml -n exporters
