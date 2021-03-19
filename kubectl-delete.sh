#!/bin/bash

kubectl apply -k ./template/overlays/default/service-broker
kubectl apply -k ./template/overlays/default/kanban-replicator
kubectl apply -k ./template/overlays/default/send-anything
kubectl apply -k ./template/overlays/default/status-kanban
kubectl apply -k ./template/overlays/default/mongo
kubectl apply -k ./template/overlays/default/redis
