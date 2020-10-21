#!/bin/bash

kubectl delete -f ./template/bases/service-broker

echo "wait for service-broker terminate microservices..."
sleep 3

kubectl delete \
-f ./template/bases/kanban-replicator \
-f ./template/bases/send-anything \
-f ./template/bases/status-kanban
