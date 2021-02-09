#!/bin/bash

kubectl create secret generic dockerhub \
    --from-file=.dockerconfigjson=$HOME/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

/bin/sh ./clean-node-selector.sh

kubectl apply -f generated/default.yml
kubectl apply -f ./others/metrics-server