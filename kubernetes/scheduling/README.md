history

```text
 1004  minikube start
 1005  k get ss
 1006  k get statefulsets.apps
 1007  k get statefulsets.apps -A
 1008  k get statefulsets.apps -A
 1009  k get statefulsets.apps,po -n kube-system
 1010  k get ds
 1011  k get ds -A
 1012  k get ds,po -n kube-system
 1013  k get node
 1014  k get storageclasses.storage.k8s.io
 1015  cd kubernetes/ss-and-ds
 1016  k get all
 1017  k get statefulsets.apps,ds,po,svc,cm,secret
 1018  k apply -f statefulset.yaml
 1019  k get statefulsets.apps,ds,po,svc,cm,secret
 1020  k get statefulsets.apps,ds,po,svc,cm,secret
 1021  k get statefulsets.apps,po,svc,pvc,pv
 1022  k get po -w
 1023  k get ep
 1024  k run tmp --rm -it --image=busybox -- sh
 1025  k get statefulsets.apps,po,svc,pvc,pv
 1026  k exec db-1 -it -- bash
 1027  k apply -f statefulset.yaml
 1028  k get po -w
 1029  k get statefulsets.apps,po,svc,pvc,pv
 1030  k apply -f statefulset.yaml
 1031  k get po -w
 1032  k get statefulsets.apps,po,svc,pvc,pv
 1033  k exec db-1 -it -- bash
 1034  k run tmp --rm -it --image=busybox -- sh
 1035  k get ds
 1036  k get ds -n kube-system
 1037  k get po -n kube-system csi-hostpathplugin-nds7m -o yaml
 1038  k get po -n net-demo hello-devops -o yaml
 1039  k get ds,po 
 1040  k apply -f daemonset.yaml
 1041  k get ds,po 
 1042  k logs node-agent-x8lx9
 1043  minikube node help
 1044  minikube node --help
 1045  minikube node list
 1046  minikube node add
 1047  minikube node list
 1048  k get ds,po 
 1049  k get node
 1050  k get ds,po 
 1051  k get ds,po 
 1052  k get ds,po 
 1053  k describe po node-agent-x484r
 1054  k get ds,po -n kube-system
 1055  k describe po node-agent-x484r
 1056  k get ds,po -n kube-system -o wide
 1057  k get ds,po -o wide
 1058  k logs node-agent-x8lx9
 1059  k logs node-agent-x484r
 1060  minikube node delete minikube-m02
 1061  k get ds,po -o wide
 1062  k get ds,po -o wide
 1063  k get node
 1064  k get ds,po -o wide
 1065  k get ds,po -o wide
 1066  k get sset
 1067  k get statefulset
 1068  k delete statefulsets.apps db
 1069  k delete ds node-agent
 1070  k delete pvc data-db-0 data-db-1 data-db-2
 1071  k get pv
 1072  k get pv,pvc,po,statefulsets.apps,ds
 1073  minikube node add
 1074  k get node
 1075  k get node -o wide
 1076  k get node --show-labels
 1077  k get node --show-labels
 1078  k label node minikube-m02 gpu=nvidia
 1079  k get node --show-labels
 1080  cd ../scheduling
 1081  k get po -o wide
 1082  k get po -A -o wide
 1083  k get deploy -A -o wide
 1084  k get po -A -o wide
 1085  k apply -f nginx-deployment.yaml
 1086  k get po -o wide
 1087  k get deploy,rs,po -o wide
 1088  k get deploy,rs,po -o wide
 1089  k scale deployment nginx-deployment --replicas 5
 1090  k get deploy,rs,po -o wide
 1091  k apply -f nginx-deployment.yaml
 1092  k get deploy,rs,po -o wide
 1093  k scale deployment nginx-deployment --replicas 5
 1094  k get deploy,rs,po -o wide
 1095  k scale deployment nginx-deployment --replicas 50
 1096  k get deploy,rs,po -o wide
 1097  k scale deployment nginx-deployment --replicas 5
 1098  k get deploy,rs,po -o wide
 1099  k get deploy,rs,po -o wide
 1100  k get deploy,rs,po -o wide
 1101  k scale deployment nginx-deployment --replicas 2
 1102  k apply -f nginx-deployment.yaml
 1103  k get deploy,rs,po -o wide
 1104  k label node minikube-m02 gpu=nvidia2000
 1105  k label node minikube-m02 gpu=nvidia2000 --overwrite
 1106  k get deploy,rs,po -o wide
 1107  k describe po nginx-deployment-68d75f687f-c
 1108  k describe po nginx-deployment-68d75f687f-c2cxh
 1109  k events
 1110  k get deploy,rs,po -o wide
 1111  k label node minikube-m02 gpu=nvidia --overwrite
 1112  k get deploy,rs,po -o wide
 1113  k scale deployment nginx-deployment --replicas 5
 1114  k get deploy,rs,po -o wide
 1115  k get deploy,rs,po -o wide
 1116  k apply -f nginx-deployment.yaml
 1117  k get deploy,rs,po -o wide
 1118  k get node --show-labels
 1119  k get deploy,rs,po -o wide
 1120  k apply -f nginx-deploy-antiaffinity.yaml
 1121  k apply -f nginx-deploy-antiaffinity.yaml
 1122  k get deploy,rs,po -o wide
 1123  k get deploy,rs,po -o wide
 1124  k apply -f nginx-deploy-antiaffinity.yaml
 1125  k get deploy,rs,po -o wide
 1126  minikube node add
 1127  k get deploy,rs,po -o wide
 1128  k get deploy,rs,po -o wide
 1129  k get deploy,rs,po -o wide
 1130  k get deploy,rs,po -o wide
 1131  k get deploy,rs,po -o wide
 1132  k get deploy,rs,po -o wide
 1133  k apply -f nginx-deploy-antiaffinity.yaml
 1134  k get deploy,rs,po -o wide
 1135  minikube node delete minikube-m03
 1136  k get node
 1137  k get deploy,rs,po -o wide
 1138  k delete deployments.apps nginx-deployment
 1139  k delete deployments.apps nginx-deploy-antiaffinity
 1140  k get deploy,rs,po -o wide
 1141  k apply -f nginx-deploy-antiaffinity.yaml
 1142  k get deploy,rs,po -o wide
 1143  k scale deployment nginx-deploy-antiaffinity --replicas 3
 1144  k get deploy,rs,po -o wide
 1145  k describe po nginx-deploy-antiaffinity-75c874bbfd-z9w4q
 1146  k events
 1147  k scale deployment nginx-deploy-antiaffinity --replicas 4
 1148  k get deploy,rs,po -o wide
 1149  k delete deployments.apps nginx-deploy-antiaffinity
 1150  k get deploy,rs,po -o wide
 1151  k apply -f nginx-deploy-antiaffinity.yaml
 1152  k get deploy,rs,po -o wide
 1153  k apply -f nginx-deploy-antiaffinity.yaml
 1154  k get deploy,rs,po -o wide
 1155  k get deploy,rs,po -o wide
 1156  k get deploy,rs,po -w
 1157  k get po -w
 1158  k apply -f nginx-deploy-antiaffinity.yaml
 1159  k get po -w
 1160  k get po -o wide -w
 1161  k get deploy,rs,po -w
 1162  k get deploy,rs,po -o wide
 1163  k apply -f nginx-deploy-antiaffinity.yaml
 1164  k get po -o wide -w
 1165  k get node
 1166  k taint
 1167  k taint node
 1168  k taint node minikube
 1169  k taint node minikube env=prod:NoSchedule
 1170  k describe node minikube
 1171  k apply -f nginx-taint.yaml
 1172  k get po -o wide -w
 1173  k apply -f nginx-taint.yaml
 1174  k get po -o wide
 1175  k apply -f nginx-taint.yaml
 1176  k get po -o wide
 1177  k apply -f nginx-taint.yaml
 1178  k describe po nginx-taint-689bc89d57-
 1179  k describe po nginx-taint-689bc89d57-lhd7c
 1180  k describe deployments.apps nginx-taint
 1181  k scale deployment nginx-taint --replicas 5
 1182  k get po -o wide
 1183  k scale deployment nginx-taint --replicas 15
 1184  k get po -o wide
 1185  k scale deployment nginx-taint --replicas 5
 1186  k delete deployments.apps nginx-deploy-antiaffinity
 1187  k get po -o wide
 1188  k scale deployment nginx-taint --replicas 10
 1189  k get po -o wide
 1190  k taint node minikube-m02 env=dev:NoExecute
 1191  k get po -o wide
 1192  history 100
```