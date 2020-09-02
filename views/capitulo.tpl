<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Capítulo</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
  <body>
      <div style="overflow-x:auto;">
  % if len(records) > 0:
    <div style="overflow-x:auto;">
    <table border='0' style='width:80%; align='center'>
    <tr><th>{{records[0][1]}} {{records[0][2]}}<th></tr>
    <tr>
    <td style="text-align:justify">
    % for row in records:
        <sup>{{row[3]}}</sup> {{row[4]}}
    % end
    </td></tr></table>
    </div>
    <p>Capítulos: {{records[0][6]}} </p>
    % for c in range(records[0][6]):
        <a href="/versiculo?idbook={{records[0][5]}}&cap={{c+1}}">{{c+1}}&nbsp;</a>
    % end
   % else:
    <p> Pesquisa vazia</p>
   % end
     <p><a href="/">Voltar para o início</a></p>
     </div>
  </body>
</html>