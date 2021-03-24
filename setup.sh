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
echo $YELLOW"building images ..."$END
docker build -t ftps srcs/ftps
docker build -t nginx srcs/nginx
docker build -t mysql srcs/mysql
docker build -t wordpress srcs/wordpress
docker build -t phpmyadmin srcs/phpMyAdmin


echo $YELLOW"deploy metallb ... "$END
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f srcs/metallb.yaml


# echo $YELLOW"deploy nginx server ... "$END
# kubectl apply -f srcs/nginx.yaml

# echo $YELLOW"deploy ftps server ... "$END
# kubectl apply -f srcs/ftps.yaml

echo $YELLOW"create secrets ... "$END
kubectl apply -k ./srcs/

# echo $YELLOW"deploy mysql ... "$END
# kubectl apply -f srcs/mysql.yaml

# echo $YELLOW"deploy wordpress ... "$END
# kubectl apply -f srcs/wordpress.yaml

# echo $YELLOW"deploy PhpMyAdmin ... "$END
# kubectl apply -f srcs/phpmyadmin.yaml
