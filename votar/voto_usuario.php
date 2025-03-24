<?php

include("../cabecalho.php");
// conexão dom o banco de dados
include("../conexao.php");

?>

<!DOCTYPE html>
<html lang="en">

<head>

</head>

<body>
    <script>
        // chama arquivo para pegar ocorrencia
        function verifica(value) {
            window.location.href = "/cmas/votar/captura_fotos_usuarios.php?id=" + value;
        }
    </script>

    <div class="container -my5">
        <form method="post">
            <div class="container">
                <div class="alert alert-success">
                    <strong> Você deverá selecionar 2 (dois) Candidatos abaixo obrigatoriamente e clicar no botão finalizar para finalizar a votação</strong>
                </div>
            </div>
            <!--    CANDIDATO 1  --->
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Candidato 1</label>
                <div class="col-sm-5">
                    <select onchange="verifica(value)" class="form-select form-select-lg mb-3" id="candidato1" name="candidato1" value="<?php echo $c_candidato1 ?>" required>

                        <?php

                        echo "<option></option>";
                        // select da tabela de executores
                        $c_sql = "SELECT cadastro_usuarios.nome FROM cadastro_usuarios where tipo = 'C' ORDER BY cadastro_usuarios.nome";
                        $result = $conection->query($c_sql);
                        while ($c_linha = $result->fetch_assoc()) {

                            echo "  
                          <option>$c_linha[nome]</option>
                        ";
                        }
                        ?>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-md-2 form-label">Foto do Candidato 1</label>
                <div class="col-sm-6">
                    <div class="panel-body">
                        <img class="rounded mx-auto d-block" class="img-responsive" src="\cmas\<?php echo $c_pasta1; ?>" class="img-fluid" style="height :300px" style="width:400px">
                    </div>
                </div>
            </div>
            
            <!--    CANDIDATO 2  --->
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Candidato 2</label>
                <div class="col-sm-5">
                    <select onchange="verifica(value)" class="form-select form-select-lg mb-3" id="candidato2" name="candidato2" value="<?php echo $c_candidato1 ?>" required>

                        <?php

                        echo "<option></option>";
                        // select da tabela de executores
                        $c_sql = "SELECT cadastro_usuarios.nome FROM cadastro_usuarios where tipo = 'C' ORDER BY cadastro_usuarios.nome";
                        $result = $conection->query($c_sql);
                        while ($c_linha = $result->fetch_assoc()) {

                            echo "  
                          <option>$c_linha[nome]</option>
                        ";
                        }
                        ?>
                    </select>
                </div>
            </div>
        </form>
    </div>
</body>

</html>