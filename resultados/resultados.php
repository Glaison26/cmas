<?php
session_start();
include("../cabecalho.php");
// conexão dom o banco de dados
include("../conexao.php");
include("../lib_gop.php");
$c_senha = "";
// sql para usuarios
$c_sql_usuarios = "SELECT votos_usuarios.id_candidato, cadastro_usuarios.nome, COUNT(*) AS total FROM votos_usuarios
JOIN cadastro_usuarios ON votos_usuarios.id_candidato=cadastro_usuarios.id
GROUP BY votos_usuarios.id_candidato";
// sql para suas
$c_sql_suas = "SELECT votos_suas.id_candidato, trabalhador_suas.nome, COUNT(*) AS total FROM votos_suas
JOIN trabalhador_suas ON votos_suas.id_candidato=trabalhador_suas.id
GROUP BY votos_suas.id_candidato";
// sql para OSC
$c_sql_osc = "SELECT votos_osc.id_candidato, organizacao.nome_osc, COUNT(*) AS total FROM votos_osc
JOIN organizacao ON votos_osc.id_candidato=organizacao.id
GROUP BY votos_osc.id_candidato";

?>

<!DOCTYPE html>
<html lang="en">

<body>
    <div class="container -my5">
        <div class="container">
            <div class="alert alert-success">
                <strong>Resultados da Eleição do CMAS</strong>
            </div>
        </div>
        <!-- abas de lista de votações realizados -->
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
                                <th scope="col">Número de Votos</th>

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
                                    <td>$c_linha[total]</td>
                                  
                                </tr>
                                ";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <!--gráficos de usuários -->
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script type="text/javascript">
                    // gráfico por Valor
                    google.charts.load('current', {
                        'packages': ['corechart']
                    });
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {

                        var data = google.visualization.arrayToDataTable([
                            ['Candidato', 'Votos'],

                            <?php
                            $result_grafico = $conection->query($c_sql_usuarios);
                            // percorre resultado da query para para montar gráfico
                            while ($registro = $result_grafico->fetch_assoc()) {
                                $c_candidato = $registro['nome'];
                                $c_votos =  $registro['total'];
                            ?>['<?php echo $c_candidato ?>', <?php echo $c_votos ?>],
                            <?php } ?>
                        ]);

                        var options = {
                            is3D: true

                        };

                        var chart = new google.visualization.PieChart(document.getElementById('chart1'));

                        chart.draw(data, options);
                    }
                </script>
                <hr>
                <div style="padding-left:200px;">
                    <h3 class="text-center">Gráfico de Votação representante de usuário da Assistência Social</h3>
                    <div id="chart1" style="width: 800px; height: 600px;"></div>
                </div>
                <!-- fim de gráficos de usuários -->
            </div>
            <!-- aba trabalhadores suas-->
            <div role="tabpanel" class="tab-pane" id="suas">
                <div style="padding-top:15px;padding-left:20px;">
                    <table class="table table display table-bordered table-striped table-active tabsuas">
                        <thead class="thead">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Número de Votos</th>

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
                                    <td>$c_linha[total]</td>
                                  
                                </tr>
                                ";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <!--gráficos de usuários -->
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script type="text/javascript">
                    // gráfico por Valor
                    google.charts.load('current', {
                        'packages': ['corechart']
                    });
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {

                        var data = google.visualization.arrayToDataTable([
                            ['Candidato', 'Votos'],

                            <?php
                            $result_grafico = $conection->query($c_sql_suas);
                            // percorre resultado da query para para montar gráfico
                            while ($registro = $result_grafico->fetch_assoc()) {
                                $c_candidato = $registro['nome'];
                                $c_votos =  $registro['total'];
                            ?>['<?php echo $c_candidato ?>', <?php echo $c_votos ?>],
                            <?php } ?>
                        ]);

                        var options = {
                            is3D: true

                        };

                        var chart = new google.visualization.PieChart(document.getElementById('chart2'));

                        chart.draw(data, options);
                    }
                </script>
                <hr>
                <div style="padding-left:200px;">
                    <h3 class="text-center">Gráfico de Votação Trabalhadores SUAS</h3>
                    <div id="chart2" style="width: 800px; height: 600px;"></div>
                </div>
                <!-- fim de gráficos de usuários -->

            </div>
            <!-- aba organização OSC -->
            <div role="tabpanel" class="tab-pane" id="osc">
                <div style="padding-top:15px;padding-left:20px;">
                    <table class="table table display table-bordered table-striped table-active tabosc">
                        <thead class="thead">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Número de Votos</th>

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
                                    <td>$c_linha[total]</td>
                                  
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