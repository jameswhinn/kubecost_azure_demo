#! /bin/bash

# deploy kubecost

kubectl create namespace kubecost
helm repo add kubecost https://kubecost.github.io/cost-analyzer/
helm install kubecost kubecost/cost-analyzer --namespace kubecost --set kubecostToken="amFtZXMud2hpbm5Ad2hpbm5jb25zdWx0aW5nLmNvbQ==xm343yadf98"