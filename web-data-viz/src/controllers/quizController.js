var quizModel = require("../models/quizModel");

function listarPerguntas(req, res) {
    quizModel.listarPerguntas()
        .then(function (perguntas) {
            res.json(perguntas)
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao listar perguntas! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function salvarResultado(req, res) {
    let idUsuario = req.body.idUsuarioServer;
    quizModel.salvarResultado(idUsuario)
        .then(function (resposta) {
            let idInserido = resposta.insertId;
            res.json({
                idResultado: idInserido
            });
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao salvar resultado! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function salvarResultadoPerfil(req, res) {
    let idResultado = req.body.idResultadoServer;
    let idPerfil = req.body.idPerfilServer;
    let pontos = req.body.pontosServer;

    quizModel.salvarResultadoPerfil(idResultado, idPerfil, pontos)
        .then(function (resposta) {
            res.json(resposta)
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao salvar resultado! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function salvarResultadoPersonagem(req, res) {
    let idResultado = req.body.idResultadoServer;
    let idPersonagem = req.body.idPersonagemServer;
    let pontos = req.body.pontosServer;

    quizModel.salvarResultadoPersonagem(idResultado, idPersonagem, pontos)
        .then(function (resposta) {
            res.json(resposta)
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao salvar resultado! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function personagensComunidade(req,res) {

    quizModel.personagensComunidade()
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao exibir personagens da comunidade! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

function totalQuizzes(req,res) {

    quizModel.totalQuizzes()
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao exibir p total dos quizzes! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
}


module.exports = {
    listarPerguntas,
    salvarResultado,
    salvarResultadoPerfil,
    salvarResultadoPersonagem,
    personagensComunidade,
    totalQuizzes
};