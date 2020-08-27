<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Capítulo</title>
  </head>
  <body>
  % if len(records) > 0:
    <p>{{records[0][1]}} {{records[0][2]}} </p>
    <p style="text-align:justify">
    % for row in records:
        <sup>{{row[3]}}</sup> {{row[4]}}
    % end
    </p>
    <p>Capítulos: {{records[0][6]}} </p>
    % for c in range(records[0][6]):
        <a href="/versiculo?idbook={{records[0][5]}}&cap={{c+1}}">{{c+1}}&nbsp;</a>
    % end
   % else:
    <p> Pesquisa vazia</p>
   % end
  </body>
</html>