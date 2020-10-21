#!/bin/bash

kubectl apply \
-f ./template/overlays/default/cluster-rolebinding.yml \
-f ./template/bases/common \
-f ./template/bases/kanban-replicator \
-f ./template/bases/send-anything \
-f ./template/bases/service-broker \
-f ./template/bases/status-kanban \
-f ./others/metrics-server