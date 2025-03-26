<?php
session_start();
include("../cabecalho.php");
// conexão dom o banco de dados
include("../conexao.php");
$c_senha = "";
// sql para usuarios
$c_sql_usuarios = "SELECT cadastro_usuarios.nome, cadastro_usuarios.cpf, cadastro_usuarios.tipo, 
case
when cadastro_usuarios.tipo='C' then 'Candidato'
when cadastro_usuarios.tipo='E' then 'Eleitor'
END AS categoria
FROM cadastro_usuarios";
// sql para trabalhadores suas
$c_sql_suas = "SELECT trabalhador_suas.nome, trabalhador_suas.cpf, trabalhador_suas.tipo, 
case
when trabalhador_suas.tipo='C' then 'Candidato'
when trabalhador_suas.tipo='E' then 'Eleitor'
END AS categoria
FROM trabalhador_suas";
// sql para organizações da sociedade civil
$c_sql_osc = "SELECT organizacao.nome_osc, organizacao.cpf, organizacao.tipo, organizacao.cnpj, 
organizacao.telefone,organizacao.nome_representante,
case
when organizacao.tipo='C' then 'Candidato'
when organizacao.tipo='E' then 'Eleitor'
END AS categoria
FROM organizacao";

?>

<!DOCTYPE html>
<html lang="en">


<body>
    <div class="container -my5">
        <div class="container">
            <div class="alert alert-success">
                <strong> Prefeitura Municipal de Sabará - Pagina Inicial da plataforma.</strong>
            </div>
            <div  class="topnav">
                <a class='btn btn btn-sm'  href='\cmas\resultados\resultado.php'><img src='\cmas\imagens\oto.png' alt='' width='25' height='25'> Resultados da Votação</a>
            </div>
            <hr>
            <!-- abas de lista dos cadastros realizados -->
            <ul class="nav nav-tabs nav-tabs-responsive" role="tablist">
                <li role="presentation" class="active"><a href="#usuarios" aria-controls="usuarios" role="tab" data-toggle="tab">Usuários do SUAS</a></li>
                <li role="presentation"><a href="#suas" aria-controls="suas" role="tab" data-toggle="tab">Trabalhadores SUAS</a></li>
                <li role="presentation"><a href="#osc" aria-controls="osc" role="tab" data-toggle="tab">Organizações da Sociedade Civil</a></li>
            </ul>
            <div class="tab-content">
                <!-- aba usuários suas-->
                <div role="tabpanel" class="tab-pane active" id="usuarios">
                    <div style="padding-top:15px;padding-left:20px;">
                        <table class="table table display table-bordered table-striped table-active tabusuarios">
                            <thead class="thead">
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">CPF</th>
                                    <th scope="col">Categoria</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // faço a Leitura da tabela com sql
                                $result = $conection->query($c_sql_usuarios);
                                // verifico se a query foi correto
                                if (!$result) {
                                    die("Erro ao Executar Sql!!" . $conection->connect_error);
                                }

                                // insiro os registro do banco de dados na tabela 
                                while ($c_linha = $result->fetch_assoc()) {

                                    echo "
                                <tr>
                                    <td>$c_linha[nome]</td>
                                    <td>$c_linha[cpf]</td>
                                    <td>$c_linha[categoria]</td>
                                </tr>
                                ";
                                }
                                ?>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- aba trabalhadores suas-->
                <div role="tabpanel" class="tab-pane" id="suas">
                    <div style="padding-top:15px;padding-left:20px;">
                        <table class="table table display table-bordered table-striped table-active tabsuas">
                            <thead class="thead">
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">CPF</th>
                                    <th scope="col">Categoria</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // faço a Leitura da tabela com sql
                                $result = $conection->query($c_sql_suas);
                                // verifico se a query foi correto
                                if (!$result) {
                                    die("Erro ao Executar Sql!!" . $conection->connect_error);
                                }

                                // insiro os registro do banco de dados na tabela 
                                while ($c_linha = $result->fetch_assoc()) {

                                    echo "
                                <tr>
                                    <td>$c_linha[nome]</td>
                                    <td>$c_linha[cpf]</td>
                                    <td>$c_linha[categoria]</td>
                                </tr>
                                ";
                                }
                                ?>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- aba Organização da Sociedade Civil-->
                <div role="tabpanel" class="tab-pane" id="osc">
                    <div style="padding-top:15px;padding-left:20px;">
                        <table class="table table display table-bordered table-striped table-active tabosc">
                            <thead class="thead">
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Representante</th>
                                    <th scope="col">CNPJ</th>
                                    <th scope="col">CPF</th>
                                    <th scope="col">Telefone</th>
                                    <th scope="col">Categoria</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // faço a Leitura da tabela com sql
                                $result = $conection->query($c_sql_osc);
                                // verifico se a query foi correto
                                if (!$result) {
                                    die("Erro ao Executar Sql!!" . $conection->connect_error);
                                }

                                // insiro os registro do banco de dados na tabela 
                                while ($c_linha = $result->fetch_assoc()) {

                                    echo "
                                <tr>
                                    <td>$c_linha[nome_osc]</td>
                                    <td>$c_linha[nome_representante]</td>
                                    <td>$c_linha[cnpj]</td>
                                    <td>$c_linha[cpf]</td>
                                    <td>$c_linha[telefone]</td>
                                    <td>$c_linha[categoria]</td>
                                </tr>
                                ";
                                }
                                ?>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
</body>

</html>