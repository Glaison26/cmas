
<?php
session_start();

//echo "<h1>Gerar Excel - csv</h1>";
// conexão dom o banco de dados
include("../conexao.php");
// Aceitar csv ou texto 
header('Content-Type: text/csv; charset=utf-8');
$parametro = $_GET['id'];


// Nome arquivo
if ($parametro == '1')
    header('Content-Disposition: attachment; filename=usuarios.csv');
if ($parametro == '2')
    header('Content-Disposition: attachment; filename=trabalhadores.csv');
if ($parametro == '3')
    header('Content-Disposition: attachment; filename=organizacao.csv');

// Gravar no buffer
$resultado = fopen("php://output", 'w');

//mb_convert_encoding('Endereço', "ISO-8859-1", "UTF-8")

// Criar o cabeçalho do Excel - Usar a função mb_convert_encoding para converter carateres especiais'
// faço a Leitura da tabela com sql
if ($parametro == '1') {
    $c_sql = "SELECT cadastro_usuarios.id, cadastro_usuarios.nome, 
 case 
    WHEN tipo='C' THEN 'Candidato'
    ELSE 'Eleitor'
    END AS descricao_tipo,
  cadastro_usuarios.rg, cadastro_usuarios.cpf, cadastro_usuarios.nis, cadastro_usuarios.datanasc,
  cadastro_usuarios.servicos_programas, cadastro_usuarios.endereco, cadastro_usuarios.telefone, cadastro_usuarios.email
FROM cadastro_usuarios order by nome";
    $result = $conection->query($c_sql);
    $cabecalho = [
        'Id',
        'Nome',
        'Tipo',
        'RG',
        'CPF',
        'NIS',
        'data Nascimento',
        'Serviços',
        'Endereço',
        'Telefone',
        'e-mail',

    ];
}
if ($parametro == '2') {
    $c_sql = "SELECT trabalhador_suas.id, trabalhador_suas.nome, 
 case 
    WHEN tipo='C' THEN 'Candidato'
    ELSE 'Eleitor'
    END AS descricao_tipo,
  trabalhador_suas.rg, trabalhador_suas.cpf, trabalhador_suas.cargo, trabalhador_suas.tempo_prestacao, 
  trabalhador_suas.servicos_programas, trabalhador_suas.endereco_res, trabalhador_suas.telefone, trabalhador_suas.email,
  trabalhador_suas.nome_org, trabalhador_suas.endereco_instituicao
FROM trabalhador_suas  order by nome ";
    $result = $conection->query($c_sql);
    $cabecalho = [
        'Id',
        'Nome',
        'Tipo',
        'RG',
        'CPF',
        'cargo',
        'Tempo Prestação',
        'serviços / Programas',
        'Enderço Res.',
        'Telefone',
        'e-mail',
        'Organização',
        'Endereço Instituição',
    ];
}
if ($parametro == '3') {
    $c_sql = "SELECT organizacao.id, organizacao.nome_osc, 
 case 
    WHEN tipo='C' THEN 'Candidato'
    ELSE 'Eleitor'
    END AS descricao_tipo,
  organizacao.numero_cmas, organizacao.cnpj, organizacao.fundacao, organizacao.endereco_osc, organizacao.nome_representante,  
  organizacao.rg, organizacao.cpf, organizacao.endereco, organizacao.telefone, organizacao.email FROM organizacao order by nome_osc ";
    $result = $conection->query($c_sql);
    $cabecalho = [
        'Id',
        'Norme Org.',
        'Tipo',
        'No. CMAS',
        'CNPJ',
        'Fundação',
        'Endereço OSC',
        'Representante',
        'Rg Rep',
        'CPF Rep',
        'Endereco Rep.',
        'Telefone',
        'e_mail'
        
    ];
}
if ($parametro == 'vs_nm') {
    $c_sql = "SELECT id,vs_nm.nome, vs_nm.email, vs_nm.cpf, vs_nm.rg, vs_nm.endereco, vs_nm.datanasc, vs_nm.telefone,
    vs_nm.curso_tecnico, vs_nm.graduacao, vs_nm.pos_graduacao,experiencia_tempo, data, hora FROM vs_nm ORDER BY nome";
    $result = $conection->query($c_sql);
    $cabecalho = [
        'Inscrição',
        'Nome',
        'e-mail',
        'cpf',
        'rg',
        'endereço',
        'data Nascimento',
        'telefone',
        'Pós Curso Técnico',
        'Graduação',
        'Pós-Graduação',
        'Experiência',
        'data',
        'hora'
    ];
}
$cabecalho = mb_convert_encoding($cabecalho, "ISO-8859-1", "UTF-8");
// Abrir o arquivo
//$arquivo = fopen('file.csv', 'w');

// Escrever o cabeçalho no arquivo
fputcsv($resultado, $cabecalho, ';');
// verifico se a query foi correto
if (!$result) {
    die("Erro ao Executar Sql!!" . $conection->connect_error);
}

// Array de dados
// insiro os registro do banco de dados na tabela 
while ($c_linha = $result->fetch_assoc()) {
    fputcsv($resultado, mb_convert_encoding($c_linha, "ISO-8859-1", "UTF-8"), ';');
}
// Fechar arquivo
fclose($resultado);
