# history

```bash
 1205  minikube start
 1206  k get ns
 1207  k delete ns net-demo
 1208  k get ns
 1209  k delete ns net-clients
 1210  k delete ns net-untrusted
 1211  k get all 
 1212  k delete deployments.apps nginx-taint
 1213  k delete svc db
 1214  k get all 
 1215  k create deployment test1 --image=busybox -- sh -c 'echo shalom!'
 1216  k get all
 1217  k get all
 1218  k get po -w
 1219  k logs test1-7b555d7df8-fjbrb
 1220  k logs test1-7b555d7df8-fjbrb --previous
 1221  k logs test1-7b555d7df8-fjbrb
 1222  k get po -w
 1223  k delete deployments.apps test1
 1224  cd kubernetes/cronjob
 1225  ls
 1226  k apply -f job.yaml
 1227  k get all 
 1228  k create deployment test1 --image=busybox -- sh -c 'echo shalom!'
 1229  k get all
 1230  k get po -w
 1231  k logs test1-7b555d7df8-cfwhc
 1232  k get po -w
 1233  k delete deployments.apps test1
 1234  k get all
 1235  k apply -f job.yaml
 1236  k get job
 1237  k get jobs
 1238  k get jobs migrate -w
 1239  k delete job migrate
 1240  k apply -f job.yaml
 1241  k get jobs migrate -w
 1242  k get po
 1243  k logs migrate-qhbhx
 1244  k logs jobs/migrate
 1245  k get do
 1246  k get po
 1247  k logs jobs/migrate
 1248  k get job
 1249  k get job
 1250  k get job
 1251  k apply -f job-failing.yaml
 1252  k get po -w
 1253  k get job
 1254  k get job
 1255  k get po
 1256  k describe job notagoodjob
 1257  k get job
 1258  k get job
 1259  watch kubectl get job
 1260  k get po
 1261  k logs jobs/notagoodjob
 1262  k logs --help
 1263  k get po notagoodjob-shrcx -o yaml
 1264  k logs -l job-name=notagoodjob
 1265  k logs -l job-name=notagoodjob --prefix
 1266  k delete jobs.batch notagoodjob
 1267  k get all
 1268  k apply -f job-deadline.yaml && watch kubectl get job,po
 1269  k logs -l job-name=jobwilldead --prefix
 1270  k logs jobs/jobwilldead
 1271  k get jobs.batch
 1272  k delete jobs.batch jobwilldead
 1273  k get job
 1274  k get all
 1275  k apply -f job-bug.yaml && watch kubectl get job,po
 1276  k logs jobs/jobimbug
 1277  k logs jobs/jobimbug --prefix
 1278  k delete jobs.batch jobimbug
 1279  k apply -f job-bug.yaml && watch kubectl get job,po
 1280  k logs jobs/jobimbug --prefix
 1281  k logs -l job-name=jobimbug --prefix
 1282  k get jobs.batch
 1283  k get jobs.batch,po
 1284  k delete job jobimbug
 1285  k get jobs.batch,po
 1286  k apply -f cronjob.yaml
 1287  k get cronjob
 1288  watch kubectl get cronjob,job,po
 1289  k create job --help
 1290  k create job report-manual --from=cronjob/report
 1291  watch kubectl get cronjob,job,po
 1292  k edit cronjobs.batch report
 1293  watch kubectl get cronjob,job,po
 1294  k patch --help
 1295  k patch cronjobs.batch report -p '{"spec":{"suspend":false}}'
 1296  watch kubectl get cronjob,job,po
 1297  k get po report-29868944-cpmlc -o yaml
 1298  k delete cronjobs.batch report
 1299  k get cronjobs.batch , job,po
 1300  k get cronjobs.batch,job,po
 1301  k apply -f slow-backup.yaml
 1302  watch kubectl get cronjob,job,po
 1303  k edit cronjobs.batch slow-backup
 1304  watch kubectl get cronjob,job,po
```
