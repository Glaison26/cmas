<?php
session_start();
date_default_timezone_set('America/Sao_Paulo');
include("../cabecalho.php");
// conexão dom o banco de dados
include("../conexao.php");
$c_pasta1 = $_SESSION['foto'];
$c_logo1 = $_SESSION['logo'];
$c_candidato1 = $_SESSION['nome_candidato'];
$c_representante1 = $_SESSION['representante1'];
$c_apresentacao1 = $_SESSION['apresentacao1'];
//
$c_pasta2 = $_SESSION['foto2'];
$c_logo2 = $_SESSION['logo2'];
$c_candidato2 = $_SESSION['nome_candidato2'];
$c_representante2 = $_SESSION['representante2'];
$c_apresentacao2 = $_SESSION['apresentacao2'];

$d_data = date("Y-m-d");
$c_agora = date('H:i');
$msg_erro = "";
// localizo o eleitor 
$c_sql_eleitor  = "select organizacao.nome_osc from organizacao where id='$_SESSION[id_eleitor]'";
$result = $conection->query($c_sql_eleitor);
$c_registro = $result->fetch_assoc();
$c_eleitor = $c_registro['nome_osc'];
//echo $c_pasta1;
// faço a inclusão dos votos
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    do {
        // checo se os candidatos são diferentes

        if ($c_candidato1 == $c_candidato2) {
            $msg_erro = "Candidatos selecionados não podem ser iguais!!";
            break;
        }
        // pego id do eleitor
        $i_id_eleitor = $_SESSION['id_eleitor'];
        // pego id dos candidatos
        // candidato 1
        $c_sql = "SELECT organizacao.id FROM organizacao  where organizacao.nome_osc='$c_candidato1'";
        $result = $conection->query($c_sql);
        $c_registro = $result->fetch_assoc();
        $i_id_candidato1 = $c_registro['id'];
        // candidato 2
        $c_sql = "SELECT organizacao.id FROM organizacao  where organizacao.nome_osc='$c_candidato2'";
        $result = $conection->query($c_sql);
        $c_registro = $result->fetch_assoc();
        $i_id_candidato2 = $c_registro['id'];

        // inclusão do voto1 na tabela
        $c_sql = "insert into votos_osc (id_eleitor,id_candidato, data, hora) value ('$i_id_eleitor','$i_id_candidato1','$d_data','$c_agora')";
        $result = $conection->query($c_sql);
        // inclusão do voto2 na tabela
        $c_sql = "insert into votos_osc (id_eleitor,id_candidato, data, hora) value ('$i_id_eleitor','$i_id_candidato2','$d_data','$c_agora')";
        $result = $conection->query($c_sql);
        if (!$result) {  // erro de acesso a tabela
            die("Erro ao Executar Sql!!" . $conection->connect_error);
        }
        header('location: /cmas/votar/finalizar_voto.php');
    } while (false);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>

</head>

<body>
    <script>
        // chama arquivo para pegar ocorrencia
        function verifica(value) {
            window.location.href = "/cmas/votar/captura_fotos_osc.php?id=" + value;
        }
    </script>
    <script>
        // chama arquivo para pegar ocorrencia
        function verifica2(value) {
            window.location.href = "/cmas/votar/captura_fotos_osc2.php?id=" + value;
        }
    </script>

    <div class="container -my5">
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
            <div class="container">
                <div class="alert alert-success">
                    <strong>Você deverá selecionar 2 (dois) Candidatos abaixo obrigatoriamente e clicar no botão finalizar para encerrar a votação</strong>
                </div>
            </div>
            <div class="container">
                <div class="alert alert-primary">
                    <div class="row mb-6">
                        <label class="col-sm-5 col-form-label">Organização da Sociedade Civil de Assistência Social </label>
                        <div class="col-sm-6">
                            <input readonly type="text" maxlength="120" class="form-control" name="eleitor" value="<?php echo $c_eleitor ?>" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="alert alert-info" align="center">
                    <strong>Candidato 1</strong>
                </div>
                <!--    CANDIDATO 1  --->
                <div class="row mb-6">
                    <label class="col-sm-3 col-form-label">Candidato 1</label>
                    <div class="col-sm-5">
                        <select onchange="verifica(value)" class="form-select form-select-lg mb-3" id="candidato1" name="candidato1" value="<?php echo $c_candidato1 ?>" required>

                            <?php

                            echo "<option></option>";
                            // select da tabela de executores
                            $c_sql = "SELECT organizacao.nome_osc FROM organizacao where tipo = 'C' ORDER BY organizacao.nome_osc";
                            $result = $conection->query($c_sql);
                            while ($c_linha = $result->fetch_assoc()) {
                                if (!empty($_SESSION['nome_candidato'])) {
                                    if ($_SESSION['nome_candidato'] == $c_linha['nome_osc'])
                                        $op = 'selected';
                                    else
                                        $op = "";
                                }
                                echo "  
                          <option $op>$c_linha[nome_osc]</option>
                        ";
                            }
                            ?>
                        </select>
                    </div>
                </div>



                <div class="row mb-6">
                    <label class="col-md-2 form-label">Logomarca </label>

                    <div class="panel-body">
                        <img class="rounded mx-auto d-block" class="img-responsive"
                            src="\cmas\fotos\<?php echo $c_logo1; ?>" class="img-fluid" style="height :250px" style="width:250px">
                    </div>

                </div>
                <div class="row mb-6">
                    <label class="col-sm-3 col-form-label">Representante </label>
                    <div class="col-sm-5">
                        <input readonly type="text" maxlength="120" class="form-control"
                            name="representante1" value="<?php echo $c_representante1 ?>">
                    </div>
                </div>
                <div class="row mb-6">
                    <label class="col-md-2 form-label">Foto do representante</label>
                    <div class="col-sm-6">
                        <div class="panel-body">
                            <img class="rounded mx-auto d-block" class="img-responsive" src="\cmas\fotos\<?php echo $c_pasta1; ?>" class="img-fluid" style="height :250px" style="width:250px">
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label">Apresentação</label>
                    <div class="col-sm-7">
                        <textarea readonly class="form-control" id="apresentacao" name="apresentacao" rows="6"><?php echo $c_apresentacao1 ?></textarea>
                    </div>
                </div>

                <hr>
                <!--    CANDIDATO 2  --->
                <div class="alert alert-info" align="center">
                    <strong>Candidato 1</strong>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label">Candidato 2</label>
                    <div class="col-sm-5">
                        <select onchange="verifica2(value)" class="form-select form-select-lg mb-3" id="candidato2" name="candidato2" value="<?php echo $c_candidato1 ?>" required>

                            <?php

                            echo "<option></option>";
                            // select da tabela de executores
                            $c_sql = "SELECT organizacao.nome_osc FROM organizacao where tipo = 'C' ORDER BY organizacao.nome_osc";
                            $result = $conection->query($c_sql);
                            while ($c_linha = $result->fetch_assoc()) {
                                if (!empty($_SESSION['nome_candidato2'])) {
                                    if ($_SESSION['nome_candidato2'] == $c_linha['nome_osc'])
                                        $op = 'selected';
                                    else
                                        $op = "";
                                }
                                echo "  
                          <option $op>$c_linha[nome_osc]</option>";
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="row mb-6">
                    <label class="col-md-2 form-label">Logomarca</label>

                    <div class="panel-body">
                        <img class="rounded mx-auto d-block" class="img-responsive"
                            src="\cmas\fotos\<?php echo $c_logo2; ?>" class="img-fluid" style="height :250px" style="width:250px">
                    </div>

                </div>
                <div class="row mb-6">
                    <label class="col-sm-3 col-form-label">Representante </label>
                    <div class="col-sm-5">
                        <input readonly type="text" maxlength="120" class="form-control"
                            name="representante1" value="<?php echo $c_representante2 ?>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-md-2 form-label">Foto do representante</label>
                    <div class="col-sm-6">
                        <div class="panel-body">
                            <img class="rounded mx-auto d-block" class="img-responsive" src="\cmas\fotos\<?php echo $c_pasta2; ?>" class="img-fluid" style="height :250px" style="width:250px">
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label">Apresentação</label>
                    <div class="col-sm-7">
                        <textarea readonly class="form-control" id="apresentacao2" name="apresentacao2" rows="6"><?php echo $c_apresentacao2 ?></textarea>
                    </div>
                </div>
                <hr>
                <div class="row mb-3">
                    <div class="offset-sm-0 col-sm-3">
                        <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-ok'></span> Finalizar</button>
                        <a class='btn btn-danger' href='/cmas/votar/index.php'><span class='glyphicon glyphicon-remove'></span> Cancelar</a>
                    </div>
                </div>
        </form>
    </div>
</body>

</html>