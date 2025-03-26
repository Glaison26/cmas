<?php
session_start();
include("../cabecalho.php");
$c_senha = "";

?>

<!DOCTYPE html>
<html lang="en">


<body>
    <div class="container -my5">
        <div class="container">
            <div class="alert alert-success">
                <strong> Prefeitura Municipal de Sabará - Pagina Inicial da plataforma.</strong>
            </div>


            <div class="row mb-2">
                <label class="col-sm-2 col-form-label">Senha de Entrada</label>
                <div class="col-sm-2">
                    <input type="password" maxlength="20" class="form-control" name="senha" value="<?php echo $c_senha ?>" required>
                </div>
                <div class="container -my5" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" align="left">
                    <br>
                    <a id="insc" class="btn btn-primary" href="/cmas/resultados/lista.php"><img src="\cmas\imagens\login.png" alt="" width="40" height="40"></span> Fazer login</a>
                    <hr>
                </div>
                <div class="panel default class" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
                    <div class="panel-heading">
                        <img class="rounded mx-auto d-block" class="img-responsive" src="\cmas\imagens\cmas.jpg" class="img-fluid" style="height :200px" style="width:200px">
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>