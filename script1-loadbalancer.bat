echo "Realizando os deployments..."
kubectl apply -f ./load-balancer.yml --record

echo "Verificaçao da url gerada pelo serviço"
minikube service app1-service --url