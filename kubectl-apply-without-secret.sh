#!/bin/bash


/bin/sh ./clean-node-selector.sh
kubectl apply -f generated/default.yml
kubectl apply -f ./others/metrics-server