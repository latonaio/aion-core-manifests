NODE-NAME = ""
AION-MODE = ""

.PHONY: build
build:
	kubectl kustomize template/overlays/default > generated/default.yml
	#kubectl kustomize template/overlays/prj > generated/prj.yml

.PHONY: apply-node
apply-node: build-for-node
	sh kubectl-apply-target-node.sh $(NODE-NAME) $(AION-MODE)

.PHONY: delete-node
delete-node:
	sh kubectl-delete-target-node.sh $(NODE-NAME)

.PHONY: build-for-node
build-for-node:
	mkdir -p generated/$(NODE-NAME)
	@if [ "$(AION-MODE)" = "master" ]; then \
    kubectl kustomize template/overlays/master > generated/$(NODE-NAME)/default.yml ; \
	else \
	kubectl kustomize template/overlays/default > generated/$(NODE-NAME)/default.yml ; fi
	#kubectl kustomize template/overlays/prj > generated/$(NODE-NAME)/prj.yml

