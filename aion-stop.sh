#!/bin/bash

kubectl delete -k ./template/overlays/default/service-broker
kubectl delete -k ./template/overlays/default/kanban-replicator
kubectl delete -k ./template/overlays/default/send-anything
kubectl delete -k ./template/overlays/default/status-kanban
kubectl delete -k ./template/overlays/default/mongo
kubectl delete -k ./template/overlays/default/redis
