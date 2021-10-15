#!/bin/bash

echo "Waiting for RabbitMQ startup..."

run_in_rabbitmq_pod() {
    local pod=$(kubectl get pod | grep -E '^rabbitmq-[0-9a-f]+-[0-9a-z]+ ' | sed -E 's/^([^ ]+) .*$/\1/')
    kubectl exec "$pod" -- "$@"
    }

rabbitmqctl() {
    run_in_rabbitmq_pod rabbitmqctl "$@"
    }

# RabbitMQ の pod が Running になるまで待機
while ! kubectl get pod | grep -E '^rabbitmq-[0-9a-f]+-[0-9a-z]+ ' | grep Running > /dev/null; do
    sleep 1
done

# RabbitMQ のポートが開くまで待機
while ! run_in_rabbitmq_pod bash -c "nc -w 1 127.0.0.1 5672" 2> /dev/null; do
    sleep 1
done

# RabbitMQ が利用可能になるまで待機
while ! rabbitmqctl await_startup 2> /dev/null; do
    sleep 1
done
