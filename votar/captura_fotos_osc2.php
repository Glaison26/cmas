<?php
///////////////////////////////////////////////////////////////////////
// modulo para enviar valor da hora do executor selecionada para o formulário
//////////////////////////////////////////////////////////////////////

session_start();


include("../conexao.php");

$c_id = $_GET["id"];

// Exclusão do registro
$c_candidato = $c_id;
$c_sql_foto2 = "SELECT organizacao.nome_osc, organizacao.apresentacao, 
organizacao.foto, organizacao.logo, organizacao.nome_representante  FROM organizacao  where organizacao.nome_osc='$c_candidato'";
$result_foto2 = $conection->query($c_sql_foto2);
$c_linha_foto2 = $result_foto2->fetch_assoc();

$_SESSION['foto2'] = $c_linha_foto2['foto'];
$_SESSION['logo2'] = $c_linha_foto2['logo'];
$_SESSION['apresentacao2'] = $c_linha_foto2['apresentacao'];
$_SESSION['nome_candidato2'] = $c_candidato;
$_SESSION['representante2'] = $c_linha_foto2['nome_representante'];

header('location: /cmas/votar/voto_osc.php');
?>