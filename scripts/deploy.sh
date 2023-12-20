#!/bin/bash

# Aplicar o deployment da aplicação
kubectl apply -f /home/superuser/projects/k8s/

# Aguardar a implantação ser concluída (pode variar dependendo do aplicativo)
sleep 30

# Aplicar o deployment do MySQL
kubectl apply -f /home/superuser/projects/k8s/mysql-deployment.yaml

# Aguardar a implantação do MySQL ser concluída
sleep 30

# Aplicar o serviço do MySQL
kubectl apply -f /home/superuser/projects/k8s/mysql-service.yaml

# Obter o IP do serviço da aplicação
app_service_ip=$(kubectl get svc web-app-service -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "Aplicação está acessível em: http://$app_service_ip"

# Obter o IP do serviço do MySQL
mysql_service_ip=$(kubectl get svc mysql-service -o=jsonpath='{.spec.clusterIP}')
echo "MySQL está acessível em: $mysql_service_ip"

