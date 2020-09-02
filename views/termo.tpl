<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{termo}}</title>
    <style>
    table, th, td {
    border: 0px;
    border-collapse: collapse;
    padding: 15px;
}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
  <body>
      <div style="overflow-x:auto;">
   % if len(records) > 0:
          <table border='1' style='width:80%; align='center'>
              <caption>Foram encontrados {{len(records)}} versículos com o termo: '{{termo}}'</caption>
  %    tes = ''
  %    livro = ''
  %    for row in records:
  %        if row[0] != tes:
               <tr><td colspan='2' align='center'>{{str(row[0]) }}</td></tr>
  %            tes = str(row[0])
  %        end
  %        if row[1] != livro:
               <tr><th colspan='2' align='center'>{{str(row[1]) }}</th></tr>
  %            livro = str(row[1])
  %        end
        <tr><td align='right'><a href='/versiculo?idbook={{str(row[5])}}&cap={{str(row[2])}}&ver={{str(row[3])}}'>
        {{str(row[2])}}:{{str(row[3])}}</a></td><td align='justify'>{{str(row[4])}}</td></tr>
  %    end
    </table>
  % else:
    <p> Não foi encontrado nenhum versículo com o termo '{{termo}}'</p>
  % end
        <fieldset>
          <legend>Busca:</legend>
          % include('procura.tpl')
      </fieldset>
       <p></p>
  % include('lista_livros.tpl')
    <p><a href="/">Voltar para o início</a></p>
    </div>
   </body>
</html>