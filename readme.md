### ノード一覧を取得
```shell
kubectl get node -o wide
```

## 単体構成でのAIONのデプロイ方法
### マニフェスト作成
```shell
make build
```

### AIONのデプロイ
```shell
sh kubectl-apply.sh
```

### AIONの削除
```shell
sh kubectl-delete.sh
```

## クラスター構成でのAIONのデプロイ方法
### マニフェスト作成

`hostname` は配備したいnodeのホスト名を使用すること
```shell
# master
make build-master HOST=$(hostname)

# worker
make build-worker HOST=$(hostname)
```

### AIONのデプロイ
```shell
# master
make apply-master

# worker
make apply-worker HOST=$(hostname)
```

### AIONの削除
```shell
# master
make delete-master

# worker
make delete-worker HOST=$(hostname)
```
