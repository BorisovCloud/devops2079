# Домашнее задание: переезд сервиса из minikube в AKS с Velero

## Ситуация

Ваша команда держала сервис в тестовом кластере. Пришло время переезжать в облако — в AKS.
Сервис хранит данные на диске, и потерять их нельзя. Пересобрать всё руками «с нуля» — не
вариант: нужен перенос **объектов и данных** одной операцией, с проверкой, что всё приехало.

Инструмент — Velero, место встречи двух кластеров — Azure Blob Storage.

## Что понадобится

- minikube с аддонами `csi-hostpath-driver` и `volumesnapshots`.
- `kubectl`, `terraform`, `az`, `velero` (`brew install velero`).
- Доступ к подписке **«DevOps test»** (учётка в тенанте курса у вас есть).
- Terraform-стенд: папка `velero-aks`.
- Ваш образ `hellogo` в ghcr (блок CI/CD).

> **Это платная инфраструктура.** Создавайте стенд в день выполнения и **обязательно
> удаляйте его в конце** (шаг «Уборка»).

## Базовое задание

1. **Разверните стенд.** В `terraform.tfvars` укажите своё короткое имя в `owner` (латиница
   и цифры, 3–10 символов) и id подписки. Выполните `terraform init` и `terraform apply`.
   Создание занимает около 10 минут.
2. **Подключите оба кластера к kubectl.** Выполните команду из `terraform output
   aks_get_credentials`. Затем сделайте текущим контекст `minikube`: дальше вы всегда явно
   указываете, с каким кластером работаете (`--context`, `--kubecontext`).
3. **Запустите сервис в minikube**, в namespace `migration`:
   - ConfigMap с переменной `GREETING`, в которой ваше имя;
   - Deployment с вашим `hellogo` из ghcr, который читает этот ConfigMap, и Service;
   - PVC на классе `csi-hostpath-sc` и под, который пишет в этот том файл с текущей датой.
4. **Установите Velero в minikube** командой из `terraform output velero_install_minikube`.
   Проверьте, что хранилище в статусе `Available`.
5. **Сделайте бэкап** namespace `migration` вместе с данными томов. Убедитесь в `velero backup
   describe --details`, что том действительно попал в бэкап, а не только статус `Completed`.
6. **Подготовьте AKS:**
   - установите Velero командой из `terraform output velero_install_aks`;
   - переведите хранилище в режим `ReadOnly`;
   - настройте замену StorageClass `csi-hostpath-sc` на `managed-csi`.
7. **Восстановите сервис в AKS** из бэкапа minikube.
8. **Докажите, что переезд удался:**
   - откройте сервис в AKS в **браузере** (`kubectl port-forward` на Service) — на странице
     ваше приветствие;
   - покажите содержимое файла на томе в AKS — дата из minikube.
9. **Уборка:** `velero uninstall` в minikube, `terraform destroy`, удалите контекст AKS из
   kubeconfig.

**Контрольные вопросы к базовому заданию** (ответить письменно, коротко):
- Как AKS узнал о бэкапе, если вы ничего туда не копировали?
- Зачем хранилищу в AKS режим `ReadOnly`?
- Что случилось бы с PVC без замены StorageClass?
- Почему том на классе `standard` не переехал бы, хотя бэкап показал бы `Completed`?

## Продвинутое задание

Выполните базовое, затем добавьте:

1. **Приватный образ.** Сделайте пакет `hellogo` в ghcr приватным. В minikube создайте
   `imagePullSecret`, чтобы сервис запустился. Повторите переезд. Объясните, почему в AKS
   образ скачался без дополнительной настройки — что именно перенёс Velero?
2. **Расписание вместо ручного бэкапа.** В minikube создайте Schedule каждые 10 минут с TTL 1
   час. Измените данные на томе, дождитесь следующего бэкапа и восстановите в AKS **последний**
   бэкап расписания (`--from-schedule`). Докажите, что приехали новые данные.
3. **Консистентность.** Добавьте поду backup hook: перед бэкапом он записывает на том файл
   «снимок» (например, `date > /data/snapshot-before-backup`). Найдите этот файл после restore
   в AKS. Объясните, зачем такие хуки нужны настоящим базам данных.

## Уборка — обязательна

```bash
velero uninstall --kubecontext minikube --force
kubectl --context minikube delete namespace migration
terraform destroy
kubectl config delete-context aks-velero-<owner>
```

Проверьте в портале Azure или командой `az group exists --name rg-velero-<owner>`, что группы
больше нет (ответ `false`).
