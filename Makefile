HOST= ""

.PHONY: build
build:
	kubectl kustomize template/overlays/init_default > generated/init_default.yml
	kubectl kustomize template/overlays/init_prj > generated/init_prj.yml

	kubectl kustomize template/overlays/default > generated/default.yml
	kubectl kustomize template/overlays/prj > generated/prj.yml

.PHONY: apply-worker
apply-worker:
	sh kubectl-apply-target-node.sh $(HOST)

.PHONY: apply-master
apply-master:
	docker pull envoyproxy/envoy:v1.16-latest
	sh kubectl-apply-target-node.sh master

.PHONY: delete-worker
delete-worker:
	sh kubectl-delete-target-node.sh $(HOST)

.PHONY: delete-worker
delete-master:
	sh kubectl-delete-target-node.sh master

.PHONY: build-worker
build-worker:
	mkdir -p generated/$(HOST)
	kubectl kustomize template/overlays/worker > generated/$(HOST)/default.yml
	sed -i -e "s/_HOSTNAME_/$(HOST)/g" generated/$(HOST)/default.yml
	mkdir -p /var/lib/aion/$(HOST)/mnt/mongo_data

.PHONY: build-master
build-master:
	mkdir -p generated/master
	kubectl kustomize template/overlays/master > generated/master/default.yml
	sed -i -e "s/_HOSTNAME_/$(HOST)/g" generated/master/default.yml
	sudo mkdir -p /var/lib/aion/$(HOST)/mnt/mongo_data
