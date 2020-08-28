<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{nome}}</title>
  </head>
  <body>
  <h1>{{nome}}</h1>
     <p>Capítulos</p>
     <p>
  % for c in range(int(caps)):
    <a href="/versiculo?idbook={{idbook}}&cap={{c+1}}">{{c+1}}&nbsp;</a>
  % end
    </p>
  </body>
</html>