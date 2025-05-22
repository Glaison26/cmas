<?php
// controle de acesso ao formulário
//session_start();
//if (!isset($_SESSION['newsession'])) {
//    die('Acesso não autorizado!!!');
//}
//
include("cabecalho.php");
$c_prazo = $_GET["id"];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    
</head>

<body>
    

    <div class="container -my5">
        <div class="container">
            <div class="alert alert-success">
               <strong>Prefeitura Municipal de Sabará </strong>
            </div>
        </div>
        <div class="panel default class">
            <div class="panel-heading">
            <img class="rounded mx-auto d-block" class="img-responsive" src="\processo002\imagens\sabara.jpeg" class="img-fluid" style="height :100px" style="width:110px">
            </div>

        </div>

        <div class="container">
            <p>
            <h2 class="text-primary">
                <?php echo $c_prazo; ?>


            </h2>
            </p>
        </div>



    </div>


</body>

</html>