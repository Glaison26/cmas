<?php
session_start();
include("../cabecalho.php");
$_SESSION['foto']='';
$_SESSION['nome_candidato'] ="";
$_SESSION['foto2'] ="";
$_SESSION['nome_candidato2'] ="";
$_SESSION['apresentacao1']="";
$_SESSION['apresentacao2']="";
$_SESSION['representante1']="";
$_SESSION['representante2']="";
$_SESSION['logo']="";
$_SESSION['logo2']="";
?>

<!DOCTYPE html>
<html lang="en">


<body>
    <div class="container -my5">
        <div class="container">
            <div class="alert alert-success">
                <strong> Prefeitura Municipal de Sabará - Pagina Inicial da plataforma.</strong>
            </div>
        </div>
       
        <div class="panel default class" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
            <div class="panel-heading">
                <img class="rounded mx-auto d-block" class="img-responsive" src="\cmas\imagens\cmas.jpg" class="img-fluid" style="height :200px" style="width:200px">
            </div>
        </div>

        <div class="container -my5" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" align="left">
            <br>
            <a id="insc" class="btn btn-primary btn-lg" href="/cmas/votar/captura_cpf.php"><img src="\cmas\imagens\vote3.png" alt="" width="40" height="40"></span> Clique aqui para votar</a>
            <hr>
        </div>

</body>

</html>