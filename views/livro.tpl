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
     {{c+1}}&nbsp;
  % end
    </p>
  </body>
</html>