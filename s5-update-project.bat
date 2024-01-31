REM Controle de versao das imagens docker
SET TAG_BACKFRONT=14
SET TAG_DATABASE=11

REM Atualizar as tags nos arquivos YML
powershell -Command "(Get-Content .\arquivos_base\cicd.yml) -replace '%%TAG_BACKFRONT%%', '%TAG_BACKFRONT%' -replace '%%TAG_DATABASE%%', '%TAG_DATABASE%' | Set-Content .\.github\workflows\cicd.yml"
powershell -Command "(Get-Content .\arquivos_base\deployment.yml) -replace '%%TAG_BACKFRONT%%', '%TAG_BACKFRONT%' -replace '%%TAG_DATABASE%%', '%TAG_DATABASE%' | Set-Content deployment.yml"

REM Subir os arquivos atualizados para o GitHub
git add .
git commit -m "update 20 - entrega final" 
git push -u origin main