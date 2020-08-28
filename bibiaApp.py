import os
import sqlite3

from bottle import route, run, template, error, get, post, request, redirect


@error(404)
def error404():
    return 'Página não encontrada'


@route('/')
def index():
    return template("index")


# return template(index_html, termo='/buscar')


@get('/buscar')  # or @route('/login')
def buscar():
    return '''
    <p>Busca versos bíblicos por termos</p>
    <form action="/busca" method="post" accept-charset="ISO-8859-1">
            <label for="termo">Termo:</label>
            <input name="termo" type="text" id="termo"/><br><br>
            <input value="Buscar" type="submit" />
    </form>
    '''


@get('/busca')
def redireciona():
    redirect('/')


@post('/busca')  # or @route('/login', method='POST')
def faz_busca():
    conn = sqlite3.connect('JFAA.sqlite')
    cur = conn.cursor()

    termo = request.forms.get('termo')
    if len(termo) < 1: termo = 'mediador'

    termo = termo.rstrip().lstrip()
    resultado = procura_termo(termo, cur)
    lista_livros = retorna_livros(cur)
    temp = template("termo", records=resultado, termo=termo, livros=lista_livros)
    cur.close()
    return temp

    # https://www.sqlite.org/lang_select.html


@route('/livro', method='GET')
def lista_capitulos():
    idbook = request.query.idbook
    caps = request.query.caps
    nome_livro = request.query.nome
    # print(idbook, nome_livro, caps)
    temp = template("livro", caps=caps, nome=nome_livro, idbook=idbook)
    return temp


def procura_termo(strtermo, cur):
    cur.execute('''Select CASE WHEN B.testament_reference_id = 1 THEN 'Velho Testamento' ELSE 'Novo Testamento' END
     as testament, B.name, V.chapter, V.verse, V.text, B.id , B.tcaps
     FROM verse V INNER join book B on (B.id = V.book_id) WHERE V.text like ? 
     ORDER BY B.testament_reference_id, B.id, V.chapter, V.verse''', ("%" + strtermo + "%",))

    # row = cur.fetchone()
    records = cur.fetchall()
    return records


@route('/versiculo')
def versiculo():
    conn = sqlite3.connect('JFAA.sqlite')
    cur = conn.cursor()
    idbook = request.query.idbook
    cap = request.query.cap
    ver = request.query.ver
    # print("idbook=", idbook, "cap=", cap, "ver=", ver)
    temp = template('index')
    if bool(idbook) and bool(cap) and bool(ver):
        resultado = retorna_versiculo(idbook, cap, ver, cur)
        temp = template("versiculo", row=resultado)
    else:
        if bool(idbook) and bool(cap) and not bool(ver):
            resultado = retorna_capitulo(idbook, cap, cur)
           # print("idbook=", resultado[0][5], "cap=", resultado[0][3], "total=", resultado[0][6])
            temp = template("capitulo", records=resultado)

    cur.close()
    return temp


def retorna_versiculo(idbook, cap, ver, cur):
    cur.execute('''Select CASE WHEN B.testament_reference_id = 1 THEN 'Velho Testamento' ELSE 'Novo Testamento' END 
    as testament, B.name, V.chapter, V.verse, V.text, B.id , B.tcaps FROM verse V INNER join book B on (B.id = 
    V.book_id) WHERE B.id = ? AND  V.chapter = ? AND V.verse = ? ''', (idbook, cap, ver))

    row = cur.fetchone()
    # records = cur.fetchall()
    return row


def retorna_capitulo(idbook, cap, cur):
    cur.execute('''Select CASE WHEN B.testament_reference_id = 1 THEN 'Velho Testamento' ELSE 'Novo Testamento' END 
    as testament, B.name, V.chapter, V.verse, V.text, B.id, B.tcaps FROM verse V INNER join book B on (B.id = 
    V.book_id) WHERE B.id = ? AND  V.chapter = ? ORDER BY V.verse ''', (idbook, cap))

    # row = cur.fetchone()
    records = cur.fetchall()
    return records


def retorna_livros(cur):
    # 0 testament
    # 1 book_reference_id
    # 2 name
    # 3 abv
    # 4 tcaps
    cur.execute('''Select CASE WHEN testament_reference_id = 1 THEN 'Velho Testamento' ELSE 'Novo Testamento' END 
      as testament,  book_reference_id, name, abv, tcaps FROM book ORDER BY book_reference_id ''')
    records = cur.fetchall()
    return records


def lista_resultado(resultado, termo):
    row = None
    tes = ''
    livro = ''
    str_html = "<p>Foram encontrados " + str(len(resultado)) + " versículos com o termo: " + termo + "</p>"

    for row in resultado:
        if row[0] != tes:
            str_html += "<hr><p align='center'>" + str(row[0]) + "</p><hr>"
            tes = str(row[0])
        if row[1] != livro:
            str_html += "<h2><b>" + str(row[1]) + "</b></h2>"
            livro = str(row[1])
    str_html += "<ul><li><a href='/versiculo?idbook=" + str(row[5]) + "&cap=" + str(row[2]) + "&ver=" + str(
        row[3]) + "'>" + str(row[2]) + ":" + str(row[3]) + "</a> " + str(row[4]) + "</li></ul>"
    # = <a href="/versiculo/?idbook=&cap=&ver=">texto</a>
    str_html += "<p></p>"
    return str_html


# @route('/busca/<termo:re:[a-z]+>')
# def callback(termo):
#    print(termo)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    run(host='localhost', port=port, debug=True, reloader=True)
