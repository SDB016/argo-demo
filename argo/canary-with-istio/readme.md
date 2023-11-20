# istio로 canary deployment
istio 리소스 중 virtualService와 destinationRule을 이용해 특정 사용자를 canary 버전으로 라우팅 시킬 수 있다.

## 테스트 방법
1. `helm upgrade --install canary-with-istio .` 실행해서 chart 배포
2. `minikube service --all -n istio-ingress`로 터널을 열어 80포트 url에 요청을 보냄 -> ingressgateway의 포트별 포트포워딩 url 출력됨
    - **주의점**: header에 `Host: canary-demo-service.demo.svc.cluster.local`를 추가해야 gateway가 요청을 받을 수 있음
3. `istioctl dashboard kiali`로 요청이 원하는 대로 라우팅 되는지 모니터링
