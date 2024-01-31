echo "Deletando os servicos..."
kubectl delete service app1-service

echo "Verificacao"
kubectl get services
