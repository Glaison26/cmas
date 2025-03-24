<?php
session_start();
include("../cabecalho.php");
include("../conexao.php");

$c_cpf = "";
$msg_erro = "";
$i_quantidade1 = 0;
$i_quantidade2 = 0;
$i_quantidade3 = 0;
if ($_SERVER['REQUEST_METHOD'] == 'POST') { // post do formulario com cpf´
    do {
        $c_cpf = $_POST['cpf'];
        // Rotina para verificar em categoria ´o cpf digitado
        // procuro cpf digitado no cadastro de usuários cmas
        $c_sql = "select count(*) as quantidade_cpf from cadastro_usuarios where cpf=$c_cpf";
        $result = $conection->query($c_sql);
        $registro = $result->fetch_assoc();
        $i_quantidade1 = $registro['quantidade_cpf'];
        // procuro cpf no cadastro de trabalhadores suas
        $c_sql = "select count(*) as quantidade_cpf from trabalhador_suas where cpf=$c_cpf";
        $result = $conection->query($c_sql);
        $registro = $result->fetch_assoc();
        $i_quantidade2 = $registro['quantidade_cpf'];
        // procuro cpf no cadas de osc
        // procuro cpf no cadastro de trabalhadores suas
        $c_sql = "select count(*) as quantidade_cpf from organizacao where cpf=$c_cpf";
        $result = $conection->query($c_sql);
        $registro = $result->fetch_assoc();
        $i_quantidade3 = $registro['quantidade_cpf'];
        // procuro cpf no cadastro de trabalhadores suas
        if (($i_quantidade1 == 0) && ($i_quantidade2 == 0) && ($i_quantidade3 == 0)) {
            $msg_erro = "CPF informado não foi cadastrado, favor verificar!!";
            break;
        } else {
            // votação de usuário suas , pego os dados do eleitor
            if ($i_quantidade1 > 0) {
                // pego dados do eleitor
                $_SESSION['categoria'] = 'usuario';
                $c_sql = "select id from cadastro_usuarios where cpf=$c_cpf";
                $result = $conection->query($c_sql);
                $registro = $result->fetch_assoc();
                $_SESSION['id_eleitor'] = $registro['id'];
                $i_id_leitor = $registro['id'];
                // verifico se usuário já votou
                $c_sql = "select count(*) as votou from votos_usuarios where id_eleitor='$i_id_leitor'";
                $result = $conection->query($c_sql);
                $registro = $result->fetch_assoc();
                if ($votou > 0) {
                    $msg_erro = "CPF informado já realizou votação, favor verificar!!";
                    break;
                }
                // chamo votação
                header('location: /cmas/votar/voto_usuario.php');
            }
            // votação de trabalhador suas , pego os dados do eleitor
            if ($i_quantidade2 > 0)
                $_SESSION['categoria'] = 'suas';
            if ($i_quantidade1 > 0)
                $_SESSION['categoria'] = 'osc';
            $_SESSION['cpf'] = $c_cpf;
        }
    } while (false);
}

?>

<!DOCTYPE html>
<html lang="en">


<body>


    <div class="container -my5">

        <div class="alert alert-success">
            <strong>Informe o CPF do Eleitor e clique em continuar</strong>
        </div>

        <?php
        if (!empty($msg_erro)) {
            echo "
            <div class='alert alert-danger' role='alert'>
                <h4>Menssagem  do sistema :$msg_erro</h4>
            </div>
                ";
        }
        ?>

        <form method="post">
            <div class="row mb-3">
                <label class="col-sm-1 col-form-label">CPF</label>
                <div class="col-sm-2">
                    <input type="text" maxlength="14" class="form-control" name="cpf" value="<?php echo $c_cpf ?>" placeholder="somente números" required>
                </div>
            </div>
            <hr>
            <div class="container -my5" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" align="left">
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-circle-arrow-right'></span> Continuar</button>
                <a class='btn btn-danger' href='/cmas/index.php'><span class='glyphicon glyphicon-menu-left'></span> Voltar ao inicio</a>
            </div>
        </form>

</body>

</html>