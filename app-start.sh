# start minikube
minikube start

# point shell to minikube's docker-daemon 
# https://github.com/kubernetes/minikube/issues/9463#issuecomment-708064446
eval $(minikube -p minikube docker-env)

# build nginx & test-api dockerfiles
docker build -t nginx-local ./nginx
docker build -t test-api-local ./test-api-code

# resource configuration
kubectl apply -f ./k8s/nginx.yaml
kubectl apply -f ./k8s/test-api.yaml

# port forwarding to api service
kubectl port-forward service/test-api-service 5001:80
