#!/bin/bash


while ! kubectl get pod | grep -E '^rabbitmq-[0-9a-f]+-[0-9a-z]+ ' | grep Running > /dev/null; do
    sleep 1
done

# rabbitmqの起動をrunningになるまで待つ
pod=$(kubectl get pod | grep -E '^rabbitmq-[0-9a-f]+-[0-9a-z]+ ' | sed -E 's/^([^ ]+) .*$/\1/')
rabbitmqctl() {
       	kubectl exec "$pod" -it -- rabbitmqctl "$@"
        }
rabbitmqctl start_app
rabbitmqctl await_startup
