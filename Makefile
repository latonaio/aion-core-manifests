build:
	kustomize build --load_restrictor none ./template/overlays/default > ./generated/default.yml
	kustomize build --load_restrictor none ./template/overlays/prj > ./generated/prj.yml