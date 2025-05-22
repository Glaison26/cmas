<?php
session_start();

date_default_timezone_set('America/Sao_Paulo');

$dt_local = DateTime::createFromFormat('d-m-Y', date('d-m-Y'));
$dt_fim = DateTime::createFromFormat('d-m-Y', '20-05-2025');


if ($dt_local > $dt_fim) {
    $c_prazo = 'Inscrições para o Processo encerrado!!!';
   header('location: /cmas/prazo.php?id=' . $c_prazo);
}

// conexão dom o banco de dados
include("conexao.php");
include("cabecalho.php");
$_SESSION['c_nomefoto'] = "";
$_SESSION['c_nomefoto_osc'] = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $_SESSION['c_selecao'] = $_POST['selecao'];
    $_SESSION['c_tipo'] = $_POST['tipo'];
    // aqui direciono para formulário de eleitor ou candidato para formulário de captura de foto
    if ($_POST['selecao'] == "1" || $_POST['selecao'] == "2") {
        if ($_SESSION['c_tipo'] == 'C')
            header('location: /cmas/cadastra_usuario_foto.php'); // faço chamada da foto para candidato

        else { // chama o cadastro apenas para eleitores sem pedir foto
            if ($_POST['selecao'] == "1")
                header('location: /cmas/cadastro_usuario.php');
            if ($_SESSION['c_selecao'] == "2")
                header('location: /cmas/cadastro_representante.php');
        }
    } else {

        if ($_SESSION['c_tipo'] == 'C')  // candidato com foto
            header('location: /cmas/cadastra_osc_foto.php'); // aqui direciono para captura de foto da logo da OSC "0"
        else // apenas leitor vai direto para o cadastro
            header('location: /cmas/cadastro_osc.php');
    }
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>

    <div class="container -my5">
        <div class="container">
            <div class="alert alert-success">
                <strong>Selecione se voçê é Eleitor ou Candidato / Eleitor e clique em continuar. </strong>
            </div>
        </div>
        <form method="post">
            <div class="row mb-3">
                <div class="col-sm-3">
                    <p>
                    <h5>Eu sou :</h5>
                    </p>
                    <div class="form-check">
                        <input type="radio" name="tipo" id="tipoeleitor" Value="E" required>
                        <label class="form-check-label" for="tipoeleitor">
                            Eleitor
                        </label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="tipo" id="tipocandidato" value="C">
                        <label class="form-check-label" for="tipocandidato">
                            Candidato
                        </label>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-sm-5">
                    <p>
                    <h5>Tipo :</h5>
                    </p>
                    <div class="form-check">
                        <input type="radio" name="selecao" id="tipo_org" Value="0" required>
                        <label class="form-check-label" for="tipo_org">
                            Organização da Sociedade Civil de Assistência Social
                        </label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="selecao" id="tipo_usuario" value="1">
                        <label class="form-check-label" for="tipo_usuario">
                            Representante de Usuário da Assistência Social
                        </label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="selecao" id="tipo_suas" value="2">
                        <label class="form-check-label" for="tipo_suas">
                            Representante de Trabalhador do SUAS
                        </label>
                    </div>
                </div>
            </div>
            <br>

            <br>
            <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-circle-arrow-right'></span> Continuar</button>
            <a class='btn btn-danger' href='/cmas/index.php'><span class='glyphicon glyphicon-menu-left'></span> Voltar ao inicio</a>
        </form>
    </div>


</body>

</html>