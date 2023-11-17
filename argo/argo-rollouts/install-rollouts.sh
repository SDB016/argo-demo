#!/bin/bash

# install argo rollouts with helm
helm upgrade --install -n argo-rollouts argo-rollouts argo/argo-rollouts \
--create-namespace \
--set dashboard.enabled=true

# install kubectl argo rollouts plugins
# for m1 chip mac
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-darwin-arm64
chmod +x ./kubectl-argo-rollouts-darwin-arm64
sudo mv ./kubectl-argo-rollouts-darwin-arm64 /usr/local/bin/kubectl-argo-rollouts


# for amd64
# curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-darwin-amd64
# chmod +x ./kubectl-argo-rollouts-darwin-amd64
# mv ./kubectl-argo-rollouts-darwin-amd64 /usr/local/bin/kubectl-argo-rollouts

# kubectl argo rollouts version