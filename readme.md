## **aion-core-manifests**
aion-coreのデプロイを行うために必要不可欠なマニフェストファイル群です。

aion-coreについては[こちら](https://github.com/latonaio/aion-core)をご覧ください。
## 概要
[aion-coreのセットアップ](https://github.com/latonaio/aion-core)で作成したDocker imageからこれらのマニフェストファイルを元にaion-coreを構成します。以下では単体構成とクラスター構成のそれぞれの場合についてaion-coreのデプロイ方法と削除方法をまとめます。

なお、クラスター構成にする場合はmaster nodeのあるマシン上に配備してください。
## 動作環境
aion-coreのクローンが必要です。

* [aion-core](https://github.com/latonaio/aion-core)
* OS: Linux
* CPU: Intel64/AMD64/ARM64
* Kubernetes

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
sh aion-start.sh
```

### AIONの削除
```shell
sh aion-stop.sh
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
