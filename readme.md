1 - Primeira modificaçao: o arquivo script.sh foi substituido pelo arquivo cicd.yml dentro de .github/workflows

2 - No arquivo cicd.yml estao as chaves secretas para acesso ao docker hub. Os valores das chaves estao guardados no github Actions secrets

3 - Ao atualizar algum arquivo do projeto no vscode, atualizar as versoes da imagem do docker:
     - Na linha de comando docker build e push dentro do arquivo cicd.yml: carlosfalcone/projeto2-backfront:4.0 e carlosfalcone/projeto2-database:1.0
     - No nome do arquivo de deploy: deployment4.0.yml
     - Nas linhas de comando dentro do arquivo deploymentx.x.yml: carlosfalcone/projeto2-backfront:4.0 e carlosfalcone/projeto2-database:1.0
     - Na linha de comando dentro do arquivo script-kubernetes-win.bat: kubectl apply -f ./deployment4.0.yml --record