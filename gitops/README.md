# GitOps - ArgoCD

## Install

```bash
helm repo list
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argo-cd
helm upgrade --install argo-cd argo/argo-cd -n argo-cd --create-namespace -f values-argocd.yaml --version 10.18.0 --wait

kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

kubectl port-forward service/argo-cd-argocd-server -n argo-cd 8080:443
```

[Open ArgoCD](http://localhost:8080)
