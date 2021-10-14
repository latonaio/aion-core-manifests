## **aion-core-manifests**
aion-core-manifests は aion-core および 関連リソース のデプロイ・稼働を行うために必要不可欠なマニフェストファイルです。

aion-core および 関連リソース については[こちら](https://github.com/latonaio/aion-core)をご覧ください。
## 概要
[aion-coreのセットアップ](https://github.com/latonaio/aion-core)で作成したDocker Imagesからこれらのマニフェストファイルを元にaion-core および関連リソースを構成します。  
  
### init_default.yml
init_default.yml は、Kubenetesの定義ファイルです。
AION および関連リソースを起動する前段階で必要なリソースが立ち上がり、稼働するようにします。
aion-core-manifests の generated 下の init_default に、yamlファイルが配置されています。

定義されているリソースは、下記の通りです。

* rabbitmq

### template  
template は、(エッジ)Kubernetes環境を前提とした aion-core および 関連リソース の kubernetes 定義ファイルです。  
AION および 関連リソース をデプロイ・稼働するために必要なリソースが定義されます。   
template の bases 下に、必要なyamlファイルが配置されています。  
定義されているリソースは、下記の通りです。   

* authorization   
* service-broker   
* status-kanban   
* kanban-replicator  
* send-anything   
* redis   
* mongo    
* mongo-express      

また、template overlays 下に、overlaysとして（エッジコンピューティング環境のために必要な）yamlファイルが配置されています。（ほとんどが最低限必要な初期値で構成されています）

### generatedの生成  

以下のコマンドで、generated下のyamlファイル（default.yml）が生成されます。
```
make build
```
   
### default.yml    
aion-core-manifests の generated 下の default.yml に、サンプルとして、yamlファイルが配置されています。    

default.yml 内のリソースは、下記の通りです。（template の定義ファイルに基づいて生成されます）  

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

## 前提条件・動作環境
aion-core-manifests の使用には aion-core のクローンが必要です。また Kubernetes が動作する必要があります。

* [aion-core](https://github.com/latonaio/aion-core)
* OS: Linux
* CPU: Intel64/AMD64/ARM64
* Kubernetes

### ノード一覧を取得
```shell
kubectl get node -o wide
```

## エッジ端末単体構成でのマニフェスト作成、AIONの起動/停止方法
### マニフェスト作成（generatedが生成されます）
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

## エッジクラスター構成でのマニフェスト作成、AIONのデプロイ/削除方法
### マニフェスト作成（generatedが生成されます）

`hostname` には配備するnodeのホスト名を使用してください
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
