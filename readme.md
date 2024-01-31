## Construção da arquitetura: aplicação e banco de dados

1 - Arquitetura proposta para estudo:
    - Githube Actions para realizar o build e push das imagens docker automaticamente a cada git push executado 
    - Minikube para geração do cluster kubernetes
    - Powershell para controle do kubernetes (kubectl) (Execuçao dos arquivos locais, os mesmos carregados no repositório remoto do github)

2 - No powershell, baixe este projeto usando git:
    git clone https://github.com/carlosfalcone/k8s-projeto2-cicd.git

3 - Delete a pasta .git dentro deste projeto

4 - Crie um repositorio novo no github (publico e sem readme.md)

5 - Abra o powershell e execute o minikube:
    minikube start

6 - Verifique se o cluster foi carregado:
    kubectl get nodes

7 - Faça o deployment do load-balancer.yml manualmente (arquivo dentro da pasta do projeto):
    kubectl apply -f load-balancer.yml

8 - Verifique se o serviço foi carregado:
    kubectl get services (deve aparecer o app1-service)

9 - Obtenha a url de acesso ao pod:
    minikube service app1-service --url

10 - Copie e salve esta url no arquivo na linha exemplificada abaixo, no arquivo js.js:
    url: "http://192.168.59.101:30203/incluir.php",

11 - Suba os arquivos locais para o diretorio remoto no github. Observe que o arquivo js.js já será carregado com a alterçao na url acima.
    git init
    git add .
    git commit "insira-aqui-seu-texto"
    git branch -M main
    git remote add origin copie-e-cole-o-caminho-para-clone-https
    git push -u origin main

12 - Verifique a execução do Github Actions e se as imagens foram carregadas no docker hub

13 - Volte para o Powershell e execute o script-kubernetes-win.bat (script para windows). Ele irá fazer o deployment das imagens do docker carregadas anteriormente dentro dos pods do kubernetes:
    .\script-kubernetes-win.bat

14 - Verifique se os pods foram carregados:
    kubectl get pods

15 - Entre com a url no browser e verifique se o frontend foi carregado:
    http://192.168.59.101:30203

16 - Entre com os dados no frontend e clique no botao enviar. Se tudo ocorrer bem, você receberá uma mensagem de que os dados foram salvos.

17 - Para verificar o seu banco de dados, entre no pod do mysql e verifique os dados usando o comando mysql:
    kubectl exec --stdin --tty  [nome-do-pod-mysql] -- /bin/bash
    mysql -u root -p
    Entre com a senha
    Entre com os comandos SQL (use meubanco;) (show tables;) (etc...)


## Utilização recorrente da arquitetura

1 - Faça a atualizaçao do projeto, usando o vscode: app (frontend: index, css ou js / backend: *.php) ou bancodedados (sql)

2 - Faça a atualizaçao das versões, usando o vscode:

2.1 - Nas linhas de comando docker build e push dentro do arquivo cicd.yml: carlosfalcone/projeto2-backfront:4.0 e carlosfalcone/projeto2-database:1.0

2.2 - No nome do arquivo de deployment (ex: arquivo deployment1.0.yml)

2.3 - Nas linhas de comando dentro do arquivo deploymentx.x.yml: carlosfalcone/projeto2-backfront:4.0 e carlosfalcone/projeto2-database:1.0

2.4 - Na linha de comando dentro do arquivo script-kubernetes-win.bat: kubectl apply -f ./deployment4.0.yml --record

Estou usando --record para gravar os deploys e com isso tanto o nome do arquivo deve ser atualizado, quanto a linha de comando dentro do scrip.sh para ficar fácil de verificar o historico das gravações.

3 - Carrege as atualizações no github
    git add .
    git commit -m "xxxxx"
    git push -u origin main

4 - Execute do item 13;

    13 - Volte para o Powershell e execute o script-kubernetes-win.bat (script para windows). Ele irá fazer o deployment das imagens do docker carregadas anteriormente dentro dos pods do kubernetes:
        .\script-kubernetes-win.bat

5 - Atualize a pagina do browser e insira os dados



                    -------------------------------------------------------
Observações:

Diferenças entre esse projeto e o projeto 'k8s-projeto2':

1 - Primeira modificaçao: o arquivo script.sh foi substituido pelo arquivo cicd.yml dentro de .github/workflows

2 - No arquivo cicd.yml estao as chaves secretas para acesso ao docker hub. Os valores das chaves estao guardados no github Actions secrets

