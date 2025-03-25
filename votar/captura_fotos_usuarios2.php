<?php
///////////////////////////////////////////////////////////////////////
// modulo para enviar valor da hora do executor selecionada para o formulário
//////////////////////////////////////////////////////////////////////

session_start();


include("../conexao.php");

$c_id = $_GET["id"];

// Exclusão do registro
$c_candidato = $c_id;
$c_sql_foto2 = "SELECT cadastro_usuarios.nome, cadastro_usuarios.apresentacao, cadastro_usuarios.foto
 FROM cadastro_usuarios  where cadastro_usuarios.nome='$c_candidato'";
$result_foto2 = $conection->query($c_sql_foto2);
$c_linha_foto2 = $result_foto2->fetch_assoc();

$_SESSION['foto2'] = $c_linha_foto2['foto'];
$_SESSION['nome_candidato2'] = $c_candidato;
$_SESSION['apresentacao2'] = $c_linha_foto2['apresentacao'];

header('location: /cmas/votar/voto_usuario.php');
?>