<?php
session_start();

// conexão dom o banco de dados
include("conexao.php");
include("cabecalho.php");
include("lib_gop.php");

$msg_erro = "";
$c_nome = "";
$c_rg = "";
$c_cpf = "";
$c_tipo = "";
$c_foto = "";
$c_org = "";
$c_cargo = "";
$c_tempo = "";
$c_servico_programas = "";
$c_endereco = "";
$c_endereco_res = "";
$c_telefone = "";
$c_email = "";
$c_apresentacao = "";

// rotina para inclusão das informações no banco de dados
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    do {
        $c_nome = rtrim($_POST['nome']);
        $c_rg = $_POST['rg'];
        $c_cpf = $_POST['cpf'];
        $c_tipo = $_SESSION['c_tipo'];
        $c_foto = $_SESSION['c_nomefoto'];
        $c_cargo = $_POST['cargo'];
        $c_org = $_POST['org'];
        $c_tempo = $_POST['tempo'];
        $c_servico_programas = $_POST['servicos_programas'];
        $c_endereco = $_POST['endereco'];
        $c_endereco_res = $_POST['endereco_res'];
        $c_telefone = $_POST['telefone'];
        $c_email = $_POST['email'];
        $c_pasta_rg = "";
        $c_pasta_cpf = "";
        $c_pasta_declaracao = "";
        if ($_SESSION['c_tipo'] == 'C')
            $c_apresentacao = $_POST['apresentacao'];
        $dir = "documentos/";
        if (!validaCPF($_POST['cpf'])) {  // consistência de cpf
            $msg_erro = "CPF informado inválido!!";
            break;
        }
        // verifico via sql se cpf já não foi cadastrado
        $c_sql_pesquisa = "select count(*) as quantidade_cpf from trabalhador_suas where cpf='$c_cpf'";
        $result = $conection->query($c_sql_pesquisa);
        $registro = $result->fetch_assoc();
        if ($registro['quantidade_cpf'] > 0) {
            $msg_erro = "CPF informado já possui cadastro, favor verificar!!";
            break;
        }
        if ($_SESSION['c_tipo'] == 'C') {
            // captura rg
            $arquivo_rg = $_FILES['arquivo_rg'];
            move_uploaded_file($arquivo_rg["tmp_name"], "$dir/" . $c_nome . '_' . $arquivo_rg["name"]);
            $c_pasta_rg =  $dir . $c_nome . '_' . $arquivo_rg["name"];
            // captura cpf
            $arquivo_cpf = $_FILES['arquivo_cpf'];
            move_uploaded_file($arquivo_cpf["tmp_name"], "$dir/" . $c_nome . '_' . $arquivo_cpf["name"]);
            $c_pasta_cpf =  $dir . $c_nome . '_'  . $arquivo_cpf["name"];
            // captura declaracao
            $arquivo_declaracao = $_FILES['arquivo_declaracao'];
            move_uploaded_file($arquivo_declaracao["tmp_name"], "$dir/" . $c_nome . '_' . $arquivo_declaracao["name"]);
            $c_pasta_declaracao = $dir . $c_nome . '_'  . $arquivo_declaracao["name"];
        }

        // gravo as informações na tabela trabaladores suas
        $c_sql = "Insert into trabalhador_suas (nome,rg,cpf,cargo, nome_org, tempo_prestacao,tipo,foto,servicos_programas, endereco_instituicao, endereco_res,telefone,email,
                doc_rg, doc_cpf, doc_declaracao, apresentacao) value ('$c_nome', '$c_rg', '$c_cpf', '$c_cargo', '$c_org', '$c_tempo',  '$c_tipo', '$c_foto','$c_servico_programas', 
                '$c_endereco', '$c_endereco_res', '$c_telefone', '$c_email', '$c_pasta_rg','$c_pasta_cpf','$c_pasta_declaracao', '$c_apresentacao' )";

        $result = $conection->query($c_sql);
        // verifico se a query foi correto
        if (!$result) {  // erro de acesso a tabela
            die("Erro ao Executar Sql!!" . $conection->connect_error);
        }
        header('location: /cmas/finalizar.php');
    } while (false);
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
</head>


<body>
    <script>
        const handlePhone = (event) => {
            let input = event.target
            input.value = phoneMask(input.value)
        }

        const phoneMask = (value) => {
            if (!value) return ""
            value = value.replace(/\D/g, '')
            value = value.replace(/(\d{2})(\d)/, "($1) $2")
            value = value.replace(/(\d)(\d{4})$/, "$1-$2")
            return value
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
        <form method="post" enctype="multipart/form-data">

            <div class="row mb-3">
                <div class="container">
                    <div class="alert alert-success">
                        <strong>Entre com os dados e clique no botão de salvar abaixo. </strong>
                    </div>
                </div>
            </div>

            <div class="row mb-8">
                <label class="col-sm-2 col-form-label">Nome do Trabalhador</label>
                <div class="col-sm-6">
                    <input type="text" maxlength="120" class="form-control" name="nome" value="<?php echo $c_nome ?>" required>
                </div>
            </div>
            <br>
            <?php
            if ($_SESSION['c_tipo'] == 'C')
                echo '
                <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Apresentação</label>
                    <div class="col-sm-6">
                        <textarea class="form-control" id="apresentacao" name="apresentacao" rows="5">' . $c_apresentacao . '</textarea>
                    </div>
                </div>
                <br>';
            ?>
            <div class="row mb-3">
                <br>
                <label class="col-sm-2 col-form-label">RG </label>
                <div class="col-sm-2">
                    <input type="text" maxlength="15" class="form-control" name="rg" value="<?php echo $c_rg ?>" placeholder="somente números" required>
                </div>
                <label class="col-sm-1 col-form-label">CPF </label>
                <div class="col-sm-2">
                    <input type="text" maxlength="14" class="form-control" name="cpf" value="<?php echo $c_cpf ?>" placeholder="somente números" required>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Cargo </label>
                <div class="col-sm-6">
                    <input type="text" maxlength="150" class="form-control" name="cargo" value="<?php echo $c_cargo ?>" required>
                </div>
            </div>
            <div class="row mb-3">
                <p><strong>Tempo de Prestação de Serviço (apresentar declaração comprobratória conforme anexo VII)</strong></p>
                <div class="col-sm-8">
                    <input type="text" maxlength="20" class="form-control" name="tempo" value="<?php echo $c_tempo ?>" required>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Endereço Residencial</label>
                <div class="col-sm-6">
                    <input type="text" maxlength="120" class="form-control" name="endereco_res" value="<?php echo $c_endereco_res ?>" required>
                </div>
            </div>
            <div class="row mb-8">
                <p><strong>Organização da Sociedade Civil ou Orgão governamental em que trabalha</strong></p>
                <div class="col-sm-6">
                    <input type="text" maxlength="150" class="form-control" name="org" value="<?php echo $c_org ?>" required>
                </div>
            </div>
            <div class="row mb-10">
                <p><strong>Serviço, programas ou projetos que atua</strong></p>
                <div class="col-sm-8">
                    <textarea class="form-control" id="servicos_programas" name="servicos_programas" rows="5"><?php echo $c_servico_programas ?></textarea>
                </div>
            </div>
            <hr>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Endereço da Instituição</label>
                <div class="col-sm-6">
                    <input type="text" maxlength="120" class="form-control" name="endereco" value="<?php echo $c_endereco ?>" required>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Telefone</label>
                <div class="col-sm-2">
                    <input type="tel" onkeyup="handlePhone(event)" maxlength="25" class="form-control" name="telefone" placeholder="(XX)XXXX-XXXX" value="<?php echo $c_telefone ?>" required>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">E-mail</label>
                <div class="col-sm-6">
                    <input type="email" maxlength="120" class="form-control" name="email" value="<?php echo $c_email ?>" required>
                </div>
            </div>
            <hr>
            <?php

            if ($_SESSION['c_tipo'] == 'C')
                echo '<div class="row mb-3">
                <p>
                <h5><strong>Obrigatório anexar Xerox de RG, CPF do candidato e declaração de trabalhador do<br>SUAS, emitido preg_last_error
                        respectivo serviço ou OSC (anexo VII) <strong></h5>
                </p>

            </div>

            <div class="row mb-3">
                <p>
                <h5><strong>Cópia de Rg<strong></h5>
                </p>
                <input type="file" name="arquivo_rg" class="form-control-file" id="arquivo_rg" required>
            </div>
            <hr>
            <div class="row mb-3">
                <p>
                <h5><strong>CPF <strong></h5>
                </p>
                <input type="file" name="arquivo_cpf" class="form-control-file" id="arquivo_cpf" required>
            </div>


            <hr>
            <div class="row mb-3">
                <p>
                <h5><strong>Declaração de trabalhador do SUAS, emitido pelo respectivo serviço ou OSC (anexo VII)<strong></h5>
                </p>
                <input type="file" name="arquivo_declaracao" class="form-control-file" id="arquivo_declaracao" required>
            </div>
            <hr>';
            ?>


            <div class="container-fluid" class="col-sm-1">
                <br>
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-floppy-saved'></span> Salvar</button>
                <a class='btn btn-danger' href='/cmas/index.php'><span class='glyphicon glyphicon-remove'></span> Cancelar</a>

            </div>

        </form>
    </div>

</body>

</html>