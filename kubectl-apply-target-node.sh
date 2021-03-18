#!/bin/bash
if [ $1 = "" ] ;then
  exit 1
fi

kubectl apply -f generated/${1}/default.yml
exit 0
