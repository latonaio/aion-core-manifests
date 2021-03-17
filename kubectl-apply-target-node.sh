#!/bin/bash
if [ $1 = "" ] ;then
  exit 1
fi

sed -i \-e "s|kubernetes.io/hostname=: null|kubernetes.io/hostname: ${1}|g" generated/${1}/default.yml
sed -i \-e "s|NODE-NAME|${1}|g" generated/${1}/default.yml
#sed -i \-e "s|kubernetes.io/hostname=: null|kubernetes.io/hostname: ${1}|g" generated/${1}/prj.yml

if [ "$2" = "worker" ] ;then
  sed -i \-e "s|MODE-FOR-AION-CLUSTER|${2}|g" generated/${1}/default.yml
else
  sed -i \-e "s|MODE-FOR-AION-CLUSTER|default|g" generated/${1}/default.yml
fi

kubectl apply -f generated/${1}/default.yml
exit 0