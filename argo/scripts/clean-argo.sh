#!/bin/bash

helm -n argocd uninstall argocd
helm -n argocd uninstall argo-apps
kubectl delete ns argocd