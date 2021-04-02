#!/bin/sh

# sudo usermod -aG docker $(whoami);

GREEN='\e[0;32m'
YELLOW='\033[33m'
END='\e[0;0m'


echo $YELLOW"clearing minikube ..."$END
minikube delete
echo $YELLOW"starting minikube ..."$END
minikube start --vm-driver=docker

echo $YELLOW"opening kubernetes dashboard ..."$END
minikube dashboard &

mkdir -p /tmp/k8s_pvc/ftps

eval $(minikube docker-env)

echo $YELLOW"deploy metallb ... "$END
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f srcs/metallb.yaml

# echo $YELLOW"deploy ftps server ... "$END
# docker build -t ftps srcs/ftps
# kubectl apply -f srcs/ftps.yaml

echo $YELLOW"build and deploy nginx server ... "$END
docker build -t nginx srcs/nginx
kubectl apply -f srcs/nginx.yaml

# echo $YELLOW"create secrets ... "$END
# kubectl apply -k ./srcs/

echo $YELLOW"build and deploy mysql ... "$END
docker build -t mysql srcs/mysql
kubectl apply -f srcs/mysql.yaml

echo $YELLOW"build and deploy wordpress ... "$END
docker build -t wordpress srcs/wordpress
kubectl apply -f srcs/wordpress.yaml

echo $YELLOW"build and deploy PhpMyAdmin ... "$END
docker build -t phpmyadmin srcs/phpMyAdmin
kubectl apply -f srcs/phpmyadmin.yaml
