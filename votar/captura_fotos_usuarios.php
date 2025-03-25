<?php
///////////////////////////////////////////////////////////////////////
// modulo para enviar valor da hora do executor selecionada para o formulário
//////////////////////////////////////////////////////////////////////

session_start();


include("../conexao.php");

$c_id = $_GET["id"];

// Exclusão do registro
$c_candidato = $c_id;
$c_sql_foto1 = "SELECT cadastro_usuarios.nome, cadastro_usuarios.apresentacao, cadastro_usuarios.foto FROM cadastro_usuarios  where cadastro_usuarios.nome='$c_candidato'";
$result_foto1 = $conection->query($c_sql_foto1);
$c_linha_foto1 = $result_foto1->fetch_assoc();

$_SESSION['foto'] = $c_linha_foto1['foto'];
$_SESSION['apresentacao1'] = $c_linha_foto1['apresentacao'];
$_SESSION['nome_candidato'] = $c_candidato;

header('location: /cmas/votar/voto_usuario.php');
?>