<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Versículo</title>
  </head>
  <body>
    <p>{{row[1]}} {{row[2]}}:{{row[3]}} </p>
    <ul>
        <li>{{row[4]}}</li>
    </ul>
    <p>Capítulos: {{row[6]}} </p>
    % for c in range(row[6]):
        <a href="/versiculo?idbook={{row[5]}}&cap={{c+1}}">{{c+1}}&nbsp;</a>
    % end
  </body>
</html>