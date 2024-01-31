<!-- A atualização das senhas expostas para secrets no action hub causaram erro na aquisiçao de dados 
Os dados sao preenchidos no frontend, mas nao sao salvos no mysql. Voltei o codigo ao que era antes: senhas expostas -->

<?php
$servername = "mysql-connection";
$username = "root";
$password = "Senha123";
$database = "meubanco";

// Criar conexão


$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>
