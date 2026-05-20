var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/listarPerguntas", function (req, res) {
    quizController.listarPerguntas(req, res);
})

router.post("/salvarResultado", function (req, res) {
    quizController.salvarResultado(req, res);
})

router.post("/salvarResultadoPerfil", function (req, res) {
    quizController.salvarResultadoPerfil(req, res);
})

router.post("/salvarResultadoPersonagem", function (req, res) {
    quizController.salvarResultadoPersonagem(req, res);
})

router.post("/personagensComunidade", function (req, res) {
    quizController.personagensComunidade(req, res);
})



module.exports = router;