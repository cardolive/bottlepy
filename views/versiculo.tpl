<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Versículo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
  <body>
      <div style="overflow-x:auto;">

    <p>{{row[1]}} {{row[2]}}:{{row[3]}} </p>
    <ul>
        <li>{{row[4]}}</li>
    </ul>
    <p>Capítulos: {{row[6]}} </p>
    % for c in range(row[6]):
        <a href="/versiculo?idbook={{row[5]}}&cap={{c+1}}">{{c+1}}&nbsp;</a>
    % end
      <p><a href="/">Voltar para o início</a></p>
    </div>
  </body>
</html>