<?php
session_start();

// conexão dom o banco de dados
include("conexao.php");
include("cabecalho.php");
include("lib_gop.php");

$msg_erro = "";
$c_osa_nome = "";
$c_num_cmas = "";
$c_representante = "";
$c_rg = "";
$c_cpf = "";
$c_cnpj = "";
$c_cmas = "";
$c_fundacao = "";
$c_tipo = "";
$c_foto = "";
$c_foto_logo = "";
$c_endereco = "";
$c_endereco_osc = "";
$c_telefone = "";
$c_email = "";

// rotina para inclusão das informações no banco de dados
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    do {
        $c_osa_nome = $_POST['osa_nome'];
        $c_num_cmas = $_POST['num_cmas'];
        $c_representante = $_POST['representante'];
        $c_rg = $_POST['rg'];
        $c_cpf = $_POST['cpf'];
        $c_cnpj =$_POST['cnpj'];
        $c_fundacao =$_POST['fundacao'];
        $c_tipo = $_SESSION['c_tipo'];
        $c_foto =$_SESSION['c_nomefoto'];
        $c_foto_logo = $_SESSION['c_nomefoto_osc'];
        $c_endereco = $_POST['endereco'];
        $c_endereco_osc = $_POST['endereco_osc'];
        $c_telefone = $_POST['telefone'];
        $c_email = $_POST['email'];
        $dir = "documentos/";
        if (!validaCPF($_POST['cpf'])) {  // consistência de cpf
            $msg_erro = "CPF informado inválido!!";
            break;
        }
        if (!valida_cnpj($_POST['cnpj'])) { // consistencia de cnpj
            $msg_erro = "CNPJ informado inválido!!";
            break;
        }
        // verifico via sql se cpf já não foi cadastrado
        $c_sql_pesquisa = "select count(*) as quantidade_cnpj from organizacao where cnpj=$c_cnpj";
        $result = $conection->query($c_sql_pesquisa);
        $registro = $result->fetch_assoc();
        if ($registro['quantidade_cnpj'] > 0) {
            $msg_erro = "CNPJ informado já possui cadastro, favor verificar!!";
            break;
        }
        // captura rg
        $arquivo_rg = $_FILES['arquivo_rg'];
        move_uploaded_file($arquivo_rg["tmp_name"], "$dir/" . $c_osa_nome . '_' . $arquivo_rg["name"]);
        $c_pasta_rg =  $dir .$c_osa_nome . '_' . $arquivo_rg["name"];
        // captura cpf
        $arquivo_cpf = $_FILES['arquivo_cpf'];
        move_uploaded_file($arquivo_cpf["tmp_name"], "$dir/" . $c_osa_nome . '_' . $arquivo_cpf["name"]);
        $c_pasta_cpf = $dir . $c_osa_nome.'_'. $arquivo_cpf["name"];
        // captura comprovante
        $arquivo_comprovante = $_FILES['arquivo_comprovante'];
        move_uploaded_file($arquivo_comprovante["tmp_name"], "$dir/" . $c_osa_nome . '_' . $arquivo_comprovante["name"]);
        $c_pasta_comprovante = $dir . $c_osa_nome.'_'. $arquivo_comprovante["name"];

        // gravo as informações na tabela trabaladores suas
        $c_sql = "Insert into organizacao (foto,logo,nome_osc,tipo,numero_cmas,cnpj,fundacao, endereco_osc, nome_representante,
        rg,cpf,endereco, telefone,email, doc_rg, doc_cpf ,doc_comprovante) value 
        ('$c_foto','$c_foto_logo','$c_osa_nome', '$c_tipo', '$c_num_cmas', '$c_cnpj', '$c_fundacao', '$c_endereco_osc', '$c_representante', 
        '$c_rg', '$c_cpf','$c_endereco','$c_telefone', '$c_email', '$c_pasta_rg','$c_pasta_cpf','$c_pasta_comprovante' )";

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
          
            <div class="row mb-7">
                <p class="col-sm-6"><strong>Nome da Organização da Sociedade Civil de Assistência Social:</p><strong>
                    <div class="col-sm-7">
                        <input type="text" maxlength="120" class="form-control" name="osa_nome" value="<?php echo $c_osa_nome ?>" required>
                    </div>
            </div>
            <br>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Data da Fundação </label>
                <div class="col-sm-2">
                    <input type="date" class="form-control" name="fundacao" value="<?php echo $c_fundacao ?>" required>
                </div>
                <label class="col-sm-1 col-form-label">Telefone</label>
                <div class="col-sm-2">
                    <input type="tel" onkeyup="handlePhone(event)" maxlength="25" class="form-control" name="telefone" placeholder="(XX)XXXX-XXXX" value="<?php echo $c_telefone ?>" required>
                </div>
            </div>

            <div class="row mb-3">
                <br>
                <label class="col-sm-2 col-form-label">No. Inscrição CMAS </label>
                <div class="col-sm-2">
                    <input type="text" maxlength="2" class="form-control" name="num_cmas" value="<?php echo $c_num_cmas ?>" required>
                </div>

                <label class="col-sm-1 col-form-label">CNPJ </label>
                <div class="col-sm-2">
                    <input type="text" maxlength="14" class="form-control" name="cnpj" value="<?php echo $c_cnpj ?>" placeholder="somente números" required>
                </div>
            </div>


            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Endereço OSC </label>
                <div class="col-sm-5">
                    <input type="text" maxlength="150" class="form-control" name="endereco_osc" value="<?php echo $c_endereco_osc ?>" required>
                </div>
            </div>
            <div class="row mb-8">
                <label class="col-sm-2 col-form-label">Nome do Representante</label>
                <div class="col-sm-5">
                    <input type="text" maxlength="150" class="form-control" name="representante" value="<?php echo $c_representante ?>" required>
                </div>
            </div>
            <div class="row mb-3">

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
                <label class="col-sm-2 col-form-label">Endereço</label>
                <div class="col-sm-5">
                    <input type="text" maxlength="120" class="form-control" name="endereco" value="<?php echo $c_endereco ?>" required>
                </div>

            </div>
           
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">E-mail</label>
                <div class="col-sm-5">
                    <input type="email" maxlength="120" class="form-control" name="email" value="<?php echo $c_email ?>" required>
                </div>
            </div>
 
            <hr>
            <div class="row mb-3">
                <p>
                <h5><strong>Obrigatório anexar cópia de RG, CPF do candidato e comprovante atualizado de CNPJ da OSC. </strong></h5>
                </p>

            </div>

            <div class="row mb-3">
                <p>
                <h5><strong>Cópia de Rg<strong></h5>
                </p>
                <input type='file' name='arquivo_rg' class='form-control-file' id='arquivo_rg' required>
            </div>
           
            <div class="row mb-3">
                <p>
                <h5><strong>CPF <strong></h5>
                </p>
                <input type='file' name='arquivo_cpf' class='form-control-file' id='arquivo_cpf' required>
            </div>

            <div class="row mb-3">
                <p>
                <h5><strong>Comprovante atualizado de CNPJ da OSC<strong></h5>
                </p>
                <input type='file' name='arquivo_comprovante' class='form-control-file' id='arquivo_comprovante' required>
            </div>
          
            <div class="container-fluid" class="col-sm-1">
                <br>
                <button type="submit" class="btn btn-primary"><span class='glyphicon glyphicon-floppy-saved'></span> Salvar</button>
                <a class='btn btn-danger' href='/cmas/index.php'><span class='glyphicon glyphicon-remove'></span> Cancelar</a>

            </div>

        </form>
    </div>

</body>

</html>