var database = require("../database/config")

function listarPerguntas() {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPerguntas(): ")
    var instrucaoSql = `
                SELECT
                p.idPerguntas,
                p.texto AS pergunta,

                a.idAlternativas,
                a.texto AS alternativa,

                pe.nome AS personagem,
                pe.idPersonagens AS idPersonagem,
                pe.descricao AS personagem_descricao,
                pf.nome AS perfil,
                pf.idPerfil AS idPerfil,

                app.qtdPontos AS pontos

            FROM perguntas p

            JOIN alternativas a
                ON a.fk_perguntas = p.idPerguntas

            JOIN alternativa_personagens_pontos app
                ON app.fk_alternativas = a.idAlternativas

            JOIN personagens pe
                ON pe.idPersonagens = app.fk_personagens

            JOIN perfil pf
                ON pf.idPerfil = app.fk_perfil

            ORDER BY
                p.idPerguntas,
                a.idAlternativas;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResultado(idUsuario) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function salvarResultado(): ")
    var instrucaoSql = `
                INSERT INTO resultado_usuario (fk_usuario) VALUES
    (${idUsuario});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResultadoPerfil(idResultado, idPerfil, pontos) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function salvarResultado(): ")
    var instrucaoSql = `
                INSERT INTO resultado_perfil (fk_perfil, fk_resultado, pontos) VALUES
    (${idPerfil},${idResultado},${pontos});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResultadoPersonagem(idResultado, idPersonagem, pontos) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function salvarResultado(): ")
    var instrucaoSql = `
                INSERT INTO resultados_personagens (fk_personagem, fk_resultado, pontos) VALUES
    (${idPersonagem},${idResultado},${pontos});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function personagensComunidade() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function personagensComunidade():");

    // dando select na view
    var instrucaoSql = `
        SELECT * 
        FROM vw_personagens_comunidade;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function totalQuizzes() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function totalQuizzes():");

    // dando select na view
    var instrucaoSql = `
        SELECT COUNT(*) AS qtd_quizzes
        FROM resultado_usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

module.exports = {
    listarPerguntas,
    salvarResultado,
    salvarResultadoPerfil,
    salvarResultadoPersonagem,
    personagensComunidade,
    totalQuizzes
};