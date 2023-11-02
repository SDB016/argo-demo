#!/bin/bash

helm -n argo uninstall argocd
kubectl delete ns argo