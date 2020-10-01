USERNAME=$(shell git ls-remote --get-url |  cut -f 2 -d : | cut -f 1 -d "/")

add-to-cluster:
	kubectl apply -f https://byoc.kubesail.com/${USERNAME}.yaml
deploy-app:
	npx deploy-node-app
username:
	echo ${USERNAME}
