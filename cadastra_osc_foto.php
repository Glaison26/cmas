<?php
session_start();
// conexão dom o banco de dados
include("conexao.php");
include("cabecalho.php");
// chamada dos cadastro de usuário
if ((!isset($_POST["btnfoto"])) && ($_SERVER['REQUEST_METHOD'] == 'POST')) {  // chamada do formuálio de cadastro
   header('location: /cmas/cadastra_usuario_foto.php');
}
// inclusão de foto
if ((isset($_POST["btnfoto"])) && ($_SERVER['REQUEST_METHOD'] == 'POST')) {  // botão para incluir imagem
    $dir = "fotos/";
    $arquivo = $_FILES['arquivo'];
    $_SESSION['c_nomefoto_osc'] = $_FILES['arquivo']['name'];

    $c_nomefoto = $arquivo["name"];
    if (!empty($c_nomefoto)) {
        move_uploaded_file($arquivo["tmp_name"], "$dir/" . $arquivo["name"]);
        //echo $c_nomefoto;
        // incluir registro da imagem no banco de dados
        $c_pasta = $dir . $c_nomefoto;
    }
}
?>


<div class="container -my5">
    <div class="row mb-3">
        <div class="container">
            <div class="alert alert-secondary">
                <strong>Clique no botão  "Escolher arquivo" e selecione uma imagem da Logomarca da OSC do seu computador. Clique no botão
                    "Carregar imagem" e aguarde o carregamento da imagem. Clique no botão "continuar" para prosseguir.</strong>
            </div>
        </div>
    </div>
    <form method="post" enctype="multipart/form-data">
        <div style='padding-left:7px;'>
            <div class='panel panel-info class'>
                <div class='panel-heading'>
                    
                    <input type='file' name='arquivo' class='form-control-file' id='arquivo' accept='image/*'>
                    <br>
                    <button type='submit' name='btnfoto' id='btnfoto' class='btn btn-success'><img src='\cmas\imagens\camera.png'
                            alt='' width='20' height='20'> Carregar imagem</button>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-md-3 form-label">Foto da Logo marca da Organização da Sociedade Civil</label>
            <div class="col-sm-6">
                <div class="panel-body">
                    <img class="rounded mx-auto d-block" class="img-responsive" src="\cmas\<?php echo $c_pasta; ?>" class="img-fluid" style="height :300px" style="width:400px">
                </div>
            </div>
        </div>
        <hr>

        <div class="row mb-3">
            <div class="offset-sm-0 col-sm-3">
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-circle-arrow-right'></span> Continuar</button>
                <a class='btn btn-danger' href='/cmas/tipo_cadastro.php'><span class='glyphicon glyphicon-menu-left'></span> Voltar</a>
            </div>
        </div>

    </form>
</div>