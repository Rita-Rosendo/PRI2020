var http = require('http');
const axios = require('axios');

var servidor = http.createServer(function (req, res) {
    console.log(req.method + ' ' + req.url)
    if(req.method == 'GET'){
        if(req.url == '/'){
            res.writeHead(200,{'Content-Type' : 'text/html; charset=utf-8'})
            res.write('<h2>Escola de Música</h2>')
            res.write('<ul>');
            res.write('<li> <a href = \"http://localhost:3001/alunos\"> Lista de Alunos </a> </li>');
            res.write('<li> <a href = \"http://localhost:3001/cursos\"> Lista de Cursos </a> </li>')
            res.write('<li> <a href = \"http://localhost:3001/instrumentos\"> Lista de Instrumentos</a> </li>')
            res.write('</ul>');
            res.end()

        }
        else if(req.url == '/alunos'){
            res.writeHead(200,{'Content-Type' : 'text/html; charset=utf-8'})
            res.write('<h2>Escola de Música: Lista de Alunos</h2>')
            axios.get('http://localhost:3000/alunos')
                .then(resp => {
                    alunos = resp.data;
                    res.write('<ul>');
                    alunos.forEach(a => {
                        res.write(`<li> <p> <b> ID : ${a.id} </b> </p>
                                        <p> Nome : ${a.nome} </p>
                                        <p> Instrumento: ${a.instrumento} </p> </li>`)
                    
                    });
                    res.write('</ul>');
                    res.end()
            })
            .catch(error => {
                console.log('ERRO : ' + error);
                res.write('<p>Não conseguiu obter a lista de alunos....</p>')
                res.end()
            })            
        }
        else if(req.url == '/cursos'){
            res.writeHead(200,{'Content-Type' : 'text/html; charset=utf-8'})
            res.write('<h2>Escola de Música: Lista de Cursos</h2>')
            axios.get('http://localhost:3000/cursos')
                .then(resp => {
                    cursos = resp.data;
                    res.write('<ul>');
                    cursos.forEach(c => {
                        res.write(`<li> <p> <b> ${c.id} : ${c.designacao} </b> </p>
                                        <p> Duração: ${c.duracao} </p>
                                        <p> Instrumento: ${c.instrumento["#text"]} , ID: ${c.instrumento.id} </li>`)
                    
                    });
                    res.write('</ul>');
                    res.end()
            })
            .catch(error => {
                console.log('ERRO : ' + error);
                res.write('<p>Não conseguiu obter a lista de cursos....</p>')
                res.end()
            })            
        }
        else if(req.url == '/instrumentos'){
            res.writeHead(200,{'Content-Type' : 'text/html; charset=utf-8'})
            res.write('<h2>Escola de Música: Lista de Instrumentos</h2>')
            axios.get('http://localhost:3000/instrumentos')
                .then(resp => {
                    instrumentos = resp.data;
                    res.write('<ul>');
                    instrumentos.forEach(i => {
                            res.write(`<li> <p> <b> ID : ${i.id} </b> </p>
                                            <p> Instrumento :  ${i["#text"]} </p> </li>`)
                    });
                    res.write('</ul>');
                    res.end()
            })
            .catch(error => {
                console.log('ERRO : ' + error);
                res.write('<p>Não conseguiu obter a lista de instrumentos....</p>')
                res.end()
            })            
        }
        else {
            res.writeHead(200,{'Content-Type' : 'text/html; charset=utf-8'})
            res.write('<p> Pedido do tipo incorreto com método ' + req.method +'. </p>' +
                       '<p> Pedidos possíveis:' +
                            '<li> http://localhost:3001/alunos </li>' +
                            '<li> http://localhost:3001/cursos </li> ' +
                            '<li> http://localhost:3001/instrumentos </li>' +
                       '</p>')
            res.end()

        }

    }
    else{
        res.writeHead(200,{'Content-Type' : 'text/html'})
        res.write('<p> Pedido não suportado: ' + req.method + '</p>')
        res.end()
    }
})

servidor.listen(3001)
console.log('Servidor à escuta na porta 3001...')
