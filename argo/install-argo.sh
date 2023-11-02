#!/bin/bash

TIMEOUT=120s

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
kubectl create ns argo
helm upgrade --install -n argo argocd argo/argo-cd -f values.yaml \
--set installCRDs=false \
--set "server.config.accounts\.admin=apiKey\, login"

# ArgoCD Pod이 실행 상태가 될 때까지 대기
echo "Waiting for ArgoCD pod to be running..."
kubectl -n argo wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server --timeout=$TIMEOUT

# Pod이 실행 중이면 포트 포워딩 시작
if [ $? -eq 0 ]; then
    echo "ArgoCD pod is running. Initiating port forwarding."

    # ArgoCD 초기 관리자 비밀번호 가져오기
    initial_password=$(kubectl -n argo get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

    # 비밀번호를 강조하여 표시
    emphasized_password="*** $initial_password ***"
    echo "Initial admin password: $emphasized_password"

    # 포트 포워딩 시작 (백그라운드 실행으로 메시지 숨김)
    kubectl -n argo port-forward svc/argocd-server 8080:443 #> /dev/null 2>&1 &
else
    echo "Timeout: ArgoCD pod did not reach the running state."
fi
