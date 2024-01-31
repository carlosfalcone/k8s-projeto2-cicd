echo "Realizando os deployments..."
kubectl apply -f ./deployment10.0.yml --record

echo "Verificando o deploy:"
kubectl get deploy

echo "Verificando os pods:"
kubectl get pods

echo "Verificando os services:"
kubectl get services

@REM # Nota: use alt z para ajustar o texto dentro da janela da IDE