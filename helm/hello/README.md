# Hello Helm Chart

Этот чарт разворачивает простое приложение `hello` в Kubernetes с помощью Helm.

## Требования

- Kubernetes 1.19+
- Helm 3.x
- Доступ к кластеру Kubernetes

## Установка

Из корня репозитория:

```bash
helm install my-hello ./helm/hello
```

Или с указанием namespace:

```bash
helm install my-hello ./helm/hello --namespace dev --create-namespace
```

## Обновление

```bash
helm upgrade my-hello ./helm/hello
```

## Удаление

```bash
helm uninstall my-hello
```

## Параметры

Основные параметры можно настроить в файле `values.yaml`.

```yaml
replicaCount: 1

image:
  repository: nginxdemos/hello
  tag: latest
  pullPolicy: IfNotPresent

service:
  type: ClusterIP
  port: 80

ingress:
  enabled: false
  className: ""
  annotations: {}
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: Prefix
```

### Пример кастомизации

```bash
helm install my-hello ./helm/hello \
  --set replicaCount=2 \
  --set service.type=LoadBalancer \
  --set image.tag=stable
```

## Проверка

После установки можно проверить поды и сервис:

```bash
kubectl get pods
kubectl get svc
```

Если вы используете ingress, проверьте его состояние:

```bash
kubectl get ingress
```

## Примечания

- Перед деплоем убедитесь, что значения в `values.yaml` подходят под вашу среду.
- Для production-среды рекомендуется явно задавать теги образов и ресурсы (`resources`).
- При необходимости можно дополнительно настроить liveness и readiness probes, secrets, конфигурацию ingress и autoscaling.

## Структура чарта

```text
hello/
├── Chart.yaml
├── values.yaml
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── README.md
```
