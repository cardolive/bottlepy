<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{termo}}</title>
  </head>
  <body>
  % if len(records) > 0:
       <p>Foram encontrados {{len(records)}} versículos com o termo: {{termo}}</p>
  <%
            tes = ''
            livro = ''
    for row in records:
        if row[0] != tes:
  %>
            <hr><p align='center'>{{str(row[0]) }}</p><hr>
  <%
            tes = str(row[0])
        end
        if row[1] != livro:
  %>
            <h2><b>{{str(row[1])}}</b></h2>
  <%         livro = str(row[1])
        end %>
        <ul><li><a href='/versiculo?idbook={{str(row[5])}}&cap={{str(row[2])}}&ver={{str(row[3])}}'>
        {{str(row[2])}} :{{str(row[3])}}</a> {{str(row[4])}} </li></ul>
  % end
    </p>
  % else:
    <p> Não foi encontrado nenhum versículo com o termo '{{termo}}'</p>
  <% end
    end
  %>
      <fieldset>
          <legend>Busca:</legend>
          % include('procura.tpl')
      </fieldset>
      <p></p>
  </body>
</html>