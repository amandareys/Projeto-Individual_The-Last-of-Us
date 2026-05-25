create database theLight;
use theLight;

create table usuario (
	idUsuario int primary key auto_increment,
	nome varchar(50),
	email varchar (80),
	senha varchar (50)
);

-- TABELA PERSONAGENS
CREATE TABLE personagens (
	idPersonagens INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(100)
);

-- TABELA PERGUNTAS
CREATE TABLE perguntas (
	idPerguntas INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(200)
);

-- TABELA ALTERNATIVAS
CREATE TABLE alternativas (
	idAlternativas INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(200),
    fk_perguntas INT,
    
    CONSTRAINT fkPerguntaAlternativa
		FOREIGN KEY (fk_perguntas)
			REFERENCES perguntas(idperguntas)
);

-- TABELA PERFIL DO USUÁRIO
CREATE TABLE perfil (
	idPerfil INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45)
);

-- TABELA RELAÇÃO PERSONAGENS E ALTERNATIVAS
CREATE TABLE alternativa_personagens_pontos (
	idpontos INT PRIMARY KEY AUTO_INCREMENT,
    fk_alternativas INT,
    fk_personagens INT,
    fk_perfil INT,
    qtdPontos INT,
    
    CONSTRAINT fkAltPersonagemAlternativa
		FOREIGN KEY (fk_alternativas)
			REFERENCES alternativas(idAlternativas),
            
	CONSTRAINT fkAltPersonagemPersonagem
		FOREIGN KEY (fk_personagens)
			REFERENCES personagens(idPersonagens),
            
	CONSTRAINT fkAltPersonagemPerfil
		FOREIGN KEY (fk_perfil)
			REFERENCES perfil(idPerfil)
);

-- TABELA RESULTADO USUARIO
CREATE TABLE resultado_usuario (
	idResultado INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
            
	CONSTRAINT fkResultadoUsuario
		FOREIGN KEY (fk_usuario)
			REFERENCES usuario(idUsuario)
);

CREATE TABLE resultado_perfil (
	idResultadoPerfil INT PRIMARY KEY AUTO_INCREMENT,
	fk_resultado INT,
    fk_perfil INT,
    pontos INT,
    
    CONSTRAINT fkResultadoResultado
		FOREIGN KEY (fk_resultado)
			REFERENCES resultado_usuario(idResultado),
            
	CONSTRAINT fkResultadoPerfil
		FOREIGN KEY (fk_perfil)
			REFERENCES perfil(idPerfil)
);

CREATE TABLE resultados_personagens (
	idResultadoPersonagem INT PRIMARY KEY AUTO_INCREMENT,
	fk_resultado INT,
    fk_personagem INT,
    pontos INT,
    
    CONSTRAINT fkResultados
		FOREIGN KEY (fk_resultado)
			REFERENCES resultado_usuario(idResultado),
            
	CONSTRAINT fkPersonagens
		FOREIGN KEY (fk_personagem)
			REFERENCES personagens(idPersonagens)
);

-- PERSONAGENS
INSERT INTO personagens (nome, descricao) VALUES
('Joel', 'Protetor, reservado e estratégico'),
('Ellie', 'Intensa, emocional e determinada'),
('Abby', 'Forte, disciplinada e focada'),
('Tommy', 'Racional, leal e estratégico'),
('Dina', 'Carismática, equilibrada e empática'),
('Lev', 'Calmo, compreensivo e corajoso');

-- PERFIS
INSERT INTO perfil (nome) VALUES
('Emocional'),     -- 1
('Estratégico'),   -- 2
('Impulsivo'),     -- 3
('Empático'),      -- 4
('Racional');      -- 5



-- PERGUNTAS
INSERT INTO perguntas (texto) VALUES
('Quando Joel teve que escolher entre salvar Ellie ou a humanidade, o que você faria?'),
('Você continuaria uma jornada mesmo sabendo que pode perder tudo?'),
('Se você pudesse apagar um erro do passado:'),
('Você colocaria sua vida em risco por alguém que acabou de conhecer?'),
('Em um mundo caótico, o que mais te guia?'),
('O que é mais importante para você?'),
('Você se considera uma pessoa:'),
('No fundo, você acredita que:'),
('Em grupo, você costuma ser:'),
('Se alguém que você ama te trai:'),
('Se você tivesse que decidir o destino de alguém que fez algo imperdoável:');

-- ALTERNATIVAS

-- PERGUNTA 1
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Salvaria quem eu amo, independente das consequências', 1),
('Pensaria no bem maior, mesmo sendo difícil', 1),
('Tentaria encontrar uma solução alternativa', 1),
('Ficaria emocionalmente dividido', 1);

-- PERGUNTA 2
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Sim, iria até o fim', 2),
('Só se fosse por alguém importante', 2),
('Depende do que está em jogo', 2),
('Não, prefiro preservar o que tenho', 2);

-- PERGUNTA 3
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Faria qualquer coisa para mudar', 3),
('Mudaria, mas aceito as consequências', 3),
('Não mudaria, me tornou mais forte', 3),
('Aprenderia com ele e seguiria em frente', 3);

-- PERGUNTA 4
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Sim, sem pensar muito', 4),
('Talvez, dependendo da situação', 4),
('Não, é arriscado demais', 4),
('Só se eu realmente confiasse na pessoa', 4);

-- PERGUNTA 5
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Proteger quem eu amo', 5),
('Fazer o que é certo', 5),
('Buscar justiça', 5),
('Manter equilíbrio e segurança', 5);

-- PERGUNTA 6
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Família', 6),
('Identidade', 6),
('Propósito', 6),
('Relações e conexão', 6);

-- PERGUNTA 7
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Mais fechada e reservada', 7),
('Intensa e emocional', 7),
('Determinada e focada', 7),
('Empática e compreensiva', 7);

-- PERGUNTA 8
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Os fins justificam os meios', 8),
('Toda escolha tem consequências', 8),
('Justiça precisa ser feita', 8),
('As pessoas podem mudar', 8);

-- PERGUNTA 9
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Um líder silencioso', 9),
('Impulsivo e direto', 9),
('Estratégico e focado no objetivo', 9),
('Apoio emocional do grupo', 9);

-- PERGUNTA 10
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Nunca mais consigo confiar', 10),
('Confronto na hora', 10),
('Me afasto e sigo meu caminho', 10),
('Tento entender os motivos', 10);

-- PERGUNTA 11
INSERT INTO alternativas (texto, fk_perguntas) VALUES
('Eu decidiria com base no que sinto', 11),
('Faria o que precisa ser feito, sem hesitar', 11),
('Pensaria nas consequências antes de agir', 11),
('Evitaria tomar essa decisão sozinho', 11);

-- PONTUAÇÕES

INSERT INTO alternativa_personagens_pontos
(fk_alternativas, fk_personagens, fk_perfil, qtdPontos)
VALUES

-- PERGUNTA 1
(1, 1, 1, 8),
(2, 3, 5, 7),
(3, 4, 2, 6),
(4, 2, 1, 5),

-- PERGUNTA 2
(5, 3, 3, 8),
(6, 1, 1, 7),
(7, 4, 5, 6),
(8, 5, 4, 5),

-- PERGUNTA 3
(9, 1, 3, 9),
(10, 2, 1, 8),
(11, 3, 2, 7),
(12, 6, 5, 7),

-- PERGUNTA 4
(13, 6, 4, 10),
(14, 2, 1, 8),
(15, 3, 5, 7),
(16, 4, 2, 6),

-- PERGUNTA 5
(17, 1, 1, 10),
(18, 2, 5, 9),
(19, 3, 3, 8),
(20, 5, 4, 7),

-- PERGUNTA 6
(21, 1, 1, 10),
(22, 2, 3, 9),
(23, 3, 2, 8),
(24, 5, 4, 7),

-- PERGUNTA 7
(25, 1, 5, 9),
(26, 2, 1, 9),
(27, 3, 2, 9),
(28, 6, 4, 9),

-- PERGUNTA 8
(29, 1, 3, 10),
(30, 2, 5, 9),
(31, 3, 2, 10),
(32, 6, 4, 9),

-- PERGUNTA 9
(33, 1, 2, 9),
(34, 2, 3, 9),
(35, 4, 2, 10),
(36, 5, 4, 8),

-- PERGUNTA 10
(37, 1, 5, 10),
(38, 2, 3, 9),
(39, 5, 4, 9),
(40, 6, 4, 9),

-- PERGUNTA 11
(41, 2, 1, 10),
(42, 3, 3, 10),
(43, 4, 5, 9),
(44, 5, 4, 8);

SELECT * FROM usuario;
SELECT * FROM personagens;
SELECT * FROM perguntas;
SELECT * FROM alternativas;
SELECT * FROM perfil;
SELECT * FROM alternativa_personagens_pontos;
SELECT * FROM resultado_usuario;
SELECT * FROM resultado_perfil;
SELECT * FROM resultados_personagens;

-- SELECIONA AS PERGUNTAS E SUAS ALTERNATIVAS E A QUANTIDADE DE PONTOS PARA CADA PERFIL E CADA PERSONAGEM
SELECT
    p.idPerguntas,
    p.texto AS pergunta,

    a.idAlternativas,
    a.texto AS alternativa,

    pe.nome AS personagem,
    pe.idPersonagens AS idPersonagem,
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
    
    
    
-- VIEW resultado principal do usuário

CREATE VIEW vw_resultado_personagem AS 
SELECT 
    ru.fk_usuario,
    p.nome AS personagem,
    rp.pontos
FROM resultados_personagens rp
JOIN personagens p 
    ON rp.fk_personagem = p.idPersonagens
JOIN resultado_usuario ru
    ON rp.fk_resultado = ru.idResultado;
    
-- EXEMPLO DE USO
SELECT *
FROM vw_resultado_personagem
WHERE fk_usuario = 1
ORDER BY pontos DESC;

-- VIEW perfil do usuário
CREATE VIEW vw_resultado_perfil AS
SELECT 
    ru.fk_usuario,
    p.nome AS perfil,
    rp.pontos
FROM resultado_perfil rp
JOIN perfil p 
    ON rp.fk_perfil = p.idPerfil
JOIN resultado_usuario ru
    ON rp.fk_resultado = ru.idResultado;
    
-- EXEMPLO DE USO
SELECT *
FROM vw_resultado_perfil
WHERE fk_usuario = 1
ORDER BY pontos DESC;

-- VIEW  personagens da comunidade
CREATE VIEW vw_personagens_comunidade AS
SELECT u.idUsuario idUsuario, u.nome, p.nome personagem, rp.pontos 
FROM resultados_personagens rp
JOIN personagens p 
	ON rp.fk_personagem = p.idPersonagens
JOIN resultado_usuario ru 
	ON rp.fk_resultado = ru.idResultado
JOIN usuario u 
	ON ru.fk_usuario = u.idUsuario
WHERE rp.pontos = (
	SELECT MAX(rp.pontos)
	FROM resultados_personagens rp
	JOIN resultado_usuario ru
		ON	rp.fk_resultado = ru.idResultado
	WHERE ru.fk_usuario = idUsuario);

-- EXEMPLO DE USO
SELECT * 
FROM vw_personagens_comunidade;


-- TOTAL DE QUIZZES
SELECT COUNT(*) AS qtd_quizzes
FROM resultado_usuario;
    
    
-- TOTAL DE PESSOAS QUE TAMBEM TIRARAM AQUELE PERSONAGEM
SELECT COUNT(*) AS quantidade
FROM vw_personagens_comunidade
WHERE personagem = (
    SELECT personagem
    FROM vw_personagens_comunidade
    WHERE idUsuario = 3
)
AND idUsuario != 3;


