NODE-NAME = ""

.PHONY: build
build:
	kubectl kustomize template/overlays/default > generated/default.yml
	#kubectl kustomize template/overlays/prj > generated/prj.yml

.PHONY: apply-node
apply-node: build-for-node
	sh kubectl-apply-target-node.sh $(NODE-NAME)

.PHONY: delete-node
delete-node:
	sh kubectl-delete-target-node.sh $(NODE-NAME)

.PHONY: build-for-node
build-for-node:
	mkdir -p generated/$(NODE-NAME)
	kubectl kustomize template/overlays/default > generated/$(NODE-NAME)/default.yml
	#kubectl kustomize template/overlays/prj > generated/$(NODE-NAME)/prj.yml