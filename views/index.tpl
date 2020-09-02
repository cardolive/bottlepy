<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Busca termo na Bíblia</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
  <body>
      <div style="overflow-x:auto;">
  <p>Busca versos bíblicos por termos</p>
    <form action="/busca" method="post" accept-charset="ISO-8859-1">
            <label for="termo">Termo:</label>
            <input name="termo" type="text" id="termo"/><br><br>
            <input value="Buscar" type="submit" />
    </form>
    <p></p>
    % include('lista_livros.tpl')
    </div>
  </body>
</html>