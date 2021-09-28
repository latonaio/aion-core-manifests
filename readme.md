## **aion-core-manifests**
aion-core-manifests は aion-coreのデプロイ、稼働を行うために必要不可欠なマニフェストファイルです。

aion-coreについては[こちら](https://github.com/latonaio/aion-core)をご覧ください。
## 概要
[aion-coreのセットアップ](https://github.com/latonaio/aion-core)で作成したDocker Imagesからこれらのマニフェストファイルを元にaion-core および関連リソースを構成します。  
  
### default.yml    
default.yml は、Kubernetesの定義ファイルです。  
AION および関連リソースを起動するために必要なリソースを定義し、起動の際にその必要なリソースが立ち上がり、稼働するようにします。  
aion-core-manifests の generated 下の default.yml に、yamlファイルが配置されています。    

定義されているリソースは、下記の通りです。  

* ServiceAccount  
* ClusterRoleBinding  
* PersistentVolume  
* PersistentVolumeClaim  
* aion-servicebroker  
* aion-statuskanban  
* aion-kanban-replicator  
* aion-sendanything  
* Envoy/Configmap  
* Rediscluster  
* MongoDB  
* 各Deployment    

## 動作環境
AION の使用には aion-core のクローンが必要です。また Kubernetes が動作する必要があります。

* [aion-core](https://github.com/latonaio/aion-core)
* OS: Linux
* CPU: Intel64/AMD64/ARM64
* Kubernetes

### ノード一覧を取得
```shell
kubectl get node -o wide
```

## 単体構成でのAIONの起動/停止方法
### マニフェスト作成
```shell
make build
```

### AIONの起動
```shell
sh aion-start.sh
```

### AIONの停止
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
