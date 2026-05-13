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

function salvarResultado(req,res) {
    let idUsuario = req.body.idUsuarioServer;
    let idPersonagem = req.body.idPersonagemServer;
    let pontos = req.body.pontosServer;
    quizModel.salvarResultado(idPersonagem, idUsuario, pontos)
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

module.exports = {
    listarPerguntas,
    salvarResultado
};