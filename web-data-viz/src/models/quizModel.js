var database = require("../database/config")

function listarPerguntas() {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPerguntas(): ")
    var instrucaoSql = `
                SELECT 
            p.idperguntas,
            p.texto AS pergunta,
            
            a.idalternativas,
            a.texto AS alternativa,
            
            pe.nome AS personagem,
            app.qtdPontos AS pontos,
            pe.descricao AS personagem_descricao,
            pe.idpersonagens AS personagem_id

        FROM perguntas p

        JOIN alternativas a
            ON a.fk_perguntas = p.idperguntas

        LEFT JOIN alternativa_personagens_pontos app
            ON app.fk_alternativas = a.idalternativas

        LEFT JOIN personagens pe
            ON pe.idpersonagens = app.fk_personagens

        ORDER BY 
            p.idperguntas,
            a.idalternativas,
            pe.nome;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResultado(idPersonagem, idUsuario, pontos) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function salvarResultado(): ")
    var instrucaoSql = `
                INSERT INTO resultado_usuario (fk_personagens, fk_usuario, pontos) VALUES
    (${idPersonagem}, ${idUsuario}, ${pontos});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    listarPerguntas,
    salvarResultado
};