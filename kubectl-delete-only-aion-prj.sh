#!/bin/bash

kubectl delete deployments.apps -n prj \
	aion-servicebroker \
	aion-statuskanban \
	aion-sendanything \
	aion-kanban-replicator

# remove all service (includes ui, mysql, etc...) from prj namespace
# kubectl delete -n prj svc $(kubectl get svc -n prj | grep -v NAME | awk '{print $1}')
