#!/bin/bash

helm -n argocd uninstall argocd
helm -n argocd uninstall argo-apps
kubectl delete ns argocd
kubectl delete ns bookinfo
kubectl delete ns istio-ingress
kubectl delete ns istio-system
