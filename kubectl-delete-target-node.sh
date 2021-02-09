#!/bin/bash
echo $1
if [ $1 = "" ] ;then
  exit 1
fi
kubectl delete -f generated/${1}/default.yml
exit 0