import os, json

from bottle import run, get

with open('classificacao.json') as f:
  titulos = json.load(f)

@get('/lista')
def getAll():
    return {'titulos' : titulos}

@get('/titulo/<id>')
def pegaUm(id):
    tit='sem'
    print('id:', id)
    for t in titulos:
        print(t['ids'])
        for x in t['ids']:
            print('titulo:',t['titulo'])
            if int(x)==int(id):
                tit = t['titulo']
    return tit

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    run(host='localhost', port=port, debug=True, reloader=True)
