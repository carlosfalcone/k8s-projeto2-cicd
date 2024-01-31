REM Controle de versao das imagens docker
SET TAG_BACKFRONT=10
SET TAG_DATABASE=7


REM Atualizar as tags nos arquivos YML

powershell -Command "(Get-Content .github/workflows/cicd.yml) -replace '%%TAG_BACKFRONT%%', '%TAG_BACKFRONT%' -replace '%%TAG_DATABASE%%', '%TAG_DATABASE%' | Set-Content cicd.yml"
powershell -Command "(Get-Content deployment.yml) -replace '%%TAG_BACKFRONT%%', '%TAG_BACKFRONT%' -replace '%%TAG_DATABASE%%', '%TAG_DATABASE%' | Set-Content deployment.yml"

REM Subir os arquivos atualizados para o GitHub
git add .
git commit -m "update1"
git push -u origin main
