# history

```bash
 1307  k get role
 1308  k get role -A
 1309  k get clusterrole
 1310  k get sa
 1311  k get sa -A
 1312  k get sa
 1313  k get ns
 1314  k get sa -n storage-demo
 1315  k get sa -n storage-demo default -o yaml
 1316  k get sa -n ingress-nginx ingress-nginx
 1317  k get sa -n ingress-nginx ingress-nginx -o yaml
 1318  k get po -n ingress-nginx ingress-nginx-controller-596f8778bc-qv6sf -o yaml
 1319  k get -n ingress-nginx rolebindings.rbac.authorization.k8s.io
 1320  k get -n ingress-nginx rolebindings.rbac.authorization.k8s.io ingress-nginx -o yaml
 1321  k get -n ingress-nginx role ingress-nginx
 1322  k get -n ingress-nginx role ingress-nginx -o yaml
 1323  k get clusterrole admin -o yaml
 1324  k get clusterrole view -o yaml
 1325  k create ns team-a
 1326  cd ../rbac
 1327  k apply -f sa.yaml
 1328  k get sa -n team-a
 1329  k get -n team-a role
 1330  k apply -f role.yaml
 1331  k get -n team-a role
 1332  k get -n team-a rolebindings.rbac.authorization.k8s.io
 1333  k apply -f rolebinding.yaml
 1334  k get -n team-a rolebindings.rbac.authorization.k8s.io
 1335  k auth can-i --help
 1336  kubectl auth can-i create pods --all-namespaces
 1337  kubectl auth can-i delete pods
 1338  kubectl auth can-i delete pods -A
 1339  kubectl auth can-i delete pods --as=system:serviceaccount:team-a:ci-deployer
 1340  kubectl auth can-i get pods --as=system:serviceaccount:team-a:ci-deployer
 1341  kubectl auth can-i get pods --as=system:serviceaccount:team-a:ci-deployer -n team-a
 1342  kubectl auth can-i get pods -n team-a --as=system:serviceaccount:team-a:ci-deployer
 1343  kubectl auth can-i create pods -n team-a --as=system:serviceaccount:team-a:ci-deployer
 1344  kubectl auth can-i --list --as=system:serviceaccount:team-a:ci-deployer
 1345  kubectl auth can-i --list --as=system:serviceaccount:team-a:ci-deployer -n team-a
 1346  kubectl auth can-i --list
 1347  k exec -n ingress-nginx ingress-nginx-controller-596f8778bc-qv6sf -it -- bash
 1348  k auth whoami
 1349  kubectl auth whoami --as=system:serviceaccount:team-a:ci-deployer
```
