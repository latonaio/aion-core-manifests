#!/bin/bash

waiting () {
	sleep 10
}

kubectl create secret generic dockerhub \
    --from-file=.dockerconfigjson=$HOME/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

kubectl apply -k ./template/overlays/default/authorization
kubectl apply -k ./template/overlays/default/mongo
waiting
kubectl apply -k ./template/overlays/default/redis
waiting
kubectl apply -k ./template/overlays/default/status-kanban
waiting
kubectl apply -k ./template/overlays/default/kanban-replicator
waiting
kubectl apply -k ./template/overlays/default/send-anything
waiting
kubectl apply -k ./template/overlays/default/service-broker
