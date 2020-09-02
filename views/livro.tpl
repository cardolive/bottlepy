<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{nome}}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
  <body>
      <div style="overflow-x:auto;">
 <h1>{{nome}}</h1>
    % if len(cap1) > 0:
    <p>{{cap1[0][1]}} {{cap1[0][2]}} </p>
    <p style="text-align:justify">
    % for row in cap1:
        <sup>{{row[3]}}</sup> {{row[4]}}
    % end
    </p>

     <p>Capítulos</p>
     <p>
  % for c in range(int(caps)):
    <a href="/versiculo?idbook={{idbook}}&cap={{c+1}}">{{c+1}}&nbsp;</a>
  % end
    </p>
  <p><a href="/">Voltar para o início</a></p>
  </div>
  </body>
</html>