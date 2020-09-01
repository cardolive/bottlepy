 %    tm = ''
      <fieldset>
        <legend>Livros:</legend>
  % for lv in livros:
  %    if lv[0] != tm:
           <hr><p align='center'>{{str(lv[0]) }}</p><hr>
  %        tm = str(lv[0])
  %    end
        <a href="/livro?idbook={{lv[1]}}&caps={{lv[4]}}&nome={{lv[2]}}">{{lv[2]}}&nbsp;</a>
  % end
      </fieldset>