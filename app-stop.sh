# stop minikube
minikube stop

# unset minikube's env variables
unset `env|grep DOCKER|cut -d\= -f1`
