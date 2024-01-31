<?php
$servername = "mysql-connection";
$username = "root";
$password = getenv('MYSQL_ROOT_PASSWORD'); // Obtém a senha do secret
$database = getenv('MYSQL_DATABASE'); // Obtém o nome do banco de dados do secret


// Criar conexão

$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if ($link->connect_error) {
    die("Connect failed: " . $link->connect_error);
}
?>

