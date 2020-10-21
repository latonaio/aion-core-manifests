#!/bin/bash

kubectl apply -f generated/default.yml
kubectl apply -f ./others/metrics-server