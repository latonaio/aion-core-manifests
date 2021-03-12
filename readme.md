### ノード一覧を取得
```shell
kubectl get node -o wide
```

### aionを指定ノードにデプロイ
```shell
make apply-node NODE-NAME=${NODE_NAME}
```

### aionを指定ノードから削除
```shell
make delete-node NODE-NAME=${NODE_NAME}
```
