import os
from bottle import route, run, template

index_html = '''Minha primeira aplicação! Por {{ autor }}'''


@route('/:qualquer')
def alguma_coisa(qualquer=''):
    return template(index_html, autor=qualquer)


@route('/')
def index():
    return template(index_html, autor='Seu nome aqui:')


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    run(host='localhost', port=port, debug=True)
