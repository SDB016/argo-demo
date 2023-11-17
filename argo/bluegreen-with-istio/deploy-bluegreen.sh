#!/bin/bash

skaffold dev -f skaffold.yaml

# update rollout's image to green
# image를 green으로 변경
# kubectl argo rollouts promote blue-green-rollout-demo -n demo
# kubectl argo rollouts get rollout blue-green-rollout-demo -n demo --watch