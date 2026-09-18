minikube addons

```bash
minikube addons enable volumesnapshots
minikube addons enable csi-hostpath-driver
```

history

```text
 1003  minikube start
 1004  k get storageclasses.storage.k8s.io
 1005  k get storageclasses.storage.k8s.io standard -o yaml
 1006  k get ns
 1007  k get all -n net-demo
 1008  k create ns storage-demo
 1009  k create configmap index-config --from-file kubernetes/storage/nginx_index.html
 1010  clear
 1011  k get configmaps -n storage-demo
 1012  k create configmap index-config -n storage-demo --from-file kubernetes/storage/nginx_index.html
 1013  k get configmaps -n storage-demo
 1014  k delete configmaps index-config
 1015  k get configmaps -n storage-demo index-config -o yaml
 1016  cd kubernetes/storage
 1017  k apply -f nginx-mount-folder.yaml
 1018  k get deploy,rs,po,cm -n storage-demo
 1019  k exec -n storage-demo -it nginx-mount-folder-dcbd4898d-cx66v -- bash
 1020  k port-forward -n storage-demo nginx-mount-folder-dcbd4898d-cx66v 80:8080
 1021  k port-forward -n storage-demo nginx-mount-folder-dcbd4898d-cx66v 8080:80
 1022  k create configmap index-config -n storage-demo --from-file kubernetes/storage/nginx_index.html
 1023  k create configmap index-config -n storage-demo --from-file nginx_index.html
 1024  k create configmap --force index-config -n storage-demo --from-file nginx_index.html
 1025  k create configmap index-config -n storage-demo --from-file nginx_index.html
 1026  k delete -n storage-demo configmaps index-config
 1027  k create configmap index-config -n storage-demo --from-file nginx_index.html
 1028  k get configmaps -n storage-demo index-config -o yaml
 1029  k get deploy,rs,po,cm -n storage-demo
 1030  k describe -n storage-demo po nginx-mount-folder-dcbd4898d-cx66v
 1031  k edit -n storage-demo configmaps index-config
 1032  k get configmaps -n storage-demo index-config -o yaml
 1033  k describe -n storage-demo po nginx-mount-folder-dcbd4898d-cx66v
 1034  k apply -f nginx-mount-file.yaml
 1035  k get deploy,rs,po,cm -n storage-demo
 1036  k exec -n storage-demo -it nginx-mount-folder-dcbd4898d-cx66v -- bash
 1037  k edit -n storage-demo configmaps index-config
 1038  k exec -n storage-demo -it nginx-mount-folder-dcbd4898d-cx66v -- bash
 1039  k exec -n storage-demo -it nginx-mount-file-c9dc69c7f-dknnp -- basg
 1040  k exec -n storage-demo -it nginx-mount-file-c9dc69c7f-dknnp -- bash
 1041  k exec -n storage-demo -it nginx-mount-folder-dcbd4898d-cx66v -- bash
 1042  k exec -n storage-demo -it nginx-mount-file-c9dc69c7f-dknnp -- bash
 1043  k get deploy,rs,po,cm -n storage-demo
 1044  k delete deployments.apps -n storage-demo nginx-mount-file nginx-mount-folder
 1045  k get deploy,rs,po,cm -n storage-demo
 1046  k get storageclasses.storage.k8s.io
 1047  k get pv
 1048  k get pv,pvc
 1049  k get pv,pvc -n storage-demo
 1050  k apply -f pv.yaml
 1051  k get pv
 1052  k get pv,pvc -n storage-demo
 1053  k get pv
 1054  k apply -f pvc.yaml
 1055  k get pv,pvc
 1056  k get pv,pvc -n storage-demo
 1057  k delete pv pv-hostpath
 1058  k get pv,pvc -n storage-demo
 1059  k apply -f pvc.yaml
 1060  k get pv,pvc -n storage-demo
 1061  k apply -f pv.yaml
 1062  k get pv,pvc -n storage-demo
 1063  k get pv,pvc -n storage-demo
 1064  k apply -f pod.yaml
 1065  k exec -n storage-demo pv-demo -it -- bash
 1066  k exec -n storage-demo pv-demo -it -- sh
 1067  k exec -n storage-demo pv-demo -it -- sh
 1068  k delete -n storage-demo po pv-demo
 1069  k get pv,pvc -n storage-demo
 1070  k apply -f pod.yaml
 1071  k get pv,pvc -n storage-demo
 1072  k delete -n storage-demo po pv-demo
 1073  k get pv,pvc,po -n storage-demo
 1074  k delete -n storage-demo pvc pvc-hostpath
 1075  k get pv,pvc,po -n storage-demo
 1076  k apply -f pvc.yaml
 1077  k get pv,pvc,po -n storage-demo
 1078  k get pv,pvc,po -n storage-demo
 1079  watch kubectl get pv,pvc,po -n storage-demo
 1080  k apply -f pv.yaml
 1081  k get pv,pvc,po -n storage-demo
 1082  k apply -f pod.yaml
 1083  k get pv,pvc,po -n storage-demo
 1084  k delete -n storage-demo pod pv-demo
 1085  k delete pvc -n storage-demo pvc-hostpath
 1086  k get pv,pvc,po -n storage-demo
 1087  k delete pv pv-hostpath pv-hostpath2
 1088  k get pv,pvc,po -n storage-demo
 1089  k apply -f pv.yaml
 1090  k get pv,pvc,po -n storage-demo
 1091  k apply -f pvc.yaml
 1092  k get pv,pvc,po -n storage-demo
 1093  k apply -f pvc.yaml
 1094  k get pv,pvc,po -n storage-demo
 1095  k get pv,pvc,po -n storage-demo
 1096  k delete -n storage-demo pvc pvc-hostpath pvc-hostpath2
 1097  k get pv,pvc,po -n storage-demo
 1098  k describe pv pv-hostpath
 1099  k delete pv pv-hostpath
 1100  k get pv,pvc,po -n storage-demo
 1101  k apply -f pv.yaml
 1102  k apply -f pvc.yaml
 1103  k get pv,pvc,po -n storage-demo
 1104  k apply -f pvc.yaml
 1105  k get pv,pvc,po -n storage-demo
 1106  k get pv,pvc,po -n storage-demo
 1107  k get pv,pvc,po -n storage-demo
 1108  k get pv,pvc,po -n storage-demo
 1109  k get pv,pvc,po -n storage-demo
 1110  k delete -n storage-demo pvc pvc-hostpath pvc-hostpath2
 1111  k delete pv pv-hostpath
 1112  k get pv,pvc,po -n storage-demo
 1113  k get -n kube-system
 1114  k get -n kube-system po
 1115  minikube addons list
 1116  minikube addons enable csi-hostpath-driver
 1117  minikube addons enable volumesnapshots
 1118  k get -n kube-system po
 1119  k get csidrivers.storage.k8s.io
 1120  k get storageclasses.storage.k8s.io
 1121  k get csidrivers.storage.k8s.io hostpath.csi.k8s.io -o yaml
 1122  k get pv,pvc,po -n storage-demo
 1123  k apply -f csi-pvc.yaml
 1124  k get pv,pvc,po -n storage-demo
 1125  watch kubectl get pv,pvc,po -n storage-demo
 1126  k get pv,pvc,po -n storage-demo
 1127  k apply -f csi-pod.yaml
 1128  k get pv,pvc,po -n storage-demo
 1129  k delete po csi-pod
 1130  k apply -f csi-pod.yaml
 1131  k get pv,pvc,po -n storage-demo
 1132  k get pv,pvc,po -n storage-demo
 1133  k get pv,pvc,po -n storage-demo
 1134  k get pv,pvc,po -n storage-demo
 1135  k get pv,pvc,po -n storage-demo
 1136  k get pv,pvc,po -n storage-demo
 1137  k delete -n storage-demo po csi-pod
 1138  k get pv,pvc,po -n storage-demo
 1139  k delete -n storage-demo pvc csi-pvc
 1140  k get pv,pvc,po -n storage-demo
 1141  k get storageclasses.storage.k8s.io csi-hostpath-sc -o yaml
```