<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{nome}}</title>
  </head>
  <body>
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
  </body>
</html>