#!/bin/bash

kubectl create secret generic dockerhub \
    --from-file=.dockerconfigjson=$HOME/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

/bin/sh ./clean-node-selector.sh

kubectl apply \
-f ./template/overlays/default/cluster-rolebinding.yml \
-f ./template/bases/common \
-f ./template/bases/kanban-replicator \
-f ./template/bases/send-anything \
-f ./template/bases/service-broker \
-f ./template/bases/status-kanban \
-f ./others/metrics-server