USERNAME=$(shell git ls-remote --get-url |  cut -f 2 -d : | cut -f 1 -d "/")
PASSWORD=$(shell openssl rand -base64 32 | tr -d /=+)
add-to-cluster:
	kubectl apply -f https://byoc.kubesail.com/${USERNAME}.yaml
deploy-app:
	npx deploy-node-app
username:
	echo ${USERNAME}
replace-user-in-yaml:
	sed -i.bak "s/\$\{USERNAME\}/${USERNAME}/g" yaml/*.yaml
	sed -i.bak "s/\$\{PASSWORD\}/${PASSWORD}/g" yaml/*.yaml