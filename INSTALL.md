# CRIANDO IMAGEM
docker build -t cosmeaf_image .
docker tag cosmeaf_image:latest cosmeaf/cosmeaf_image:latest
docker push cosmeaf/cosmeaf_image:latest
docker pull cosmeaf/cosmeaf_image:latest


# CRIANDO CLUSTER KUBERNETE
minikube start —wait=false
kubectl create namespace kube-cosme-cluster
minikube start -p cosme-cluster --driver=docker --nodes=2 --no-vtx-check --namespace=kube-cosme-cluster
kubectl config use-context cosme-cluster

docker run -it -p 3306:3306 \
--name mysql \
--hostname mysql \
-e MYSQL_ROOT_PASSWORD=test \
-e MYSQL_DATABASE=test \
-e MYSQL_USER=test \
-e MYSQL_PASSWORD=test \
-d mariadb:5.5


yarn typeorm migration:run
yarn install

kubectl create secret docker-registry docker-registry-secret \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=cosmeaf \
  --docker-password=qweasd32 \
  --docker-email=cosme.alex@gmail.com
  
kubectl apply -f k8s/deployment.yaml --namespace=kube-cosme-cluster
kubectl apply -f k8s/service.yaml --namespace=kube-cosme-cluster

kubectl apply -f k8s/mysql-deployment.yaml --namespace=kube-cosme-cluster
kubectl apply -f k8s/mysql-service.yaml --namespace=kube-cosme-cluster

kubectl get pods --namespace=kube-cosme-cluster
kubectl get jobs --namespace=kube-cosme-cluster


minikube profile list   
kubectl config get-contexts
kubectl get pods
kubectl get services

kubectl describe pod NOME_DO_SEU_POD
kubectl logs NOME_DO_SEU_POD


# EXCLUDE
minikube delete -p minikube
minikube delete -p comes-cluster -n kube-cosme-cluster
