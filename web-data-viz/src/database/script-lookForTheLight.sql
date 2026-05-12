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
	idpersonagens INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(100)
);

-- TABELA PERGUNTAS
CREATE TABLE perguntas (
	idperguntas INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(200)
);

-- TABELA ALTERNATIVAS
CREATE TABLE alternativas (
	idalternativas INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(200),
    fk_perguntas INT,
    
    CONSTRAINT fkPerguntaAlternativa
		FOREIGN KEY (fk_perguntas)
			REFERENCES perguntas(idperguntas)
);

-- TABELA RESPOSTA USUARIO
CREATE TABLE resposta_usuario (
	fk_alternativas INT,
    fk_usuario INT,
    fk_perguntas INT,
    
    CONSTRAINT fkRespostaAlternativa
		FOREIGN KEY (fk_alternativas)
			REFERENCES alternativas(idalternativas),
            
	CONSTRAINT fkRespostaUsuario
		FOREIGN KEY (fk_usuario)
			REFERENCES usuario(idUsuario),
            
	CONSTRAINT fkRespostaPergunta
		FOREIGN KEY (fk_perguntas)
			REFERENCES perguntas(idperguntas)
);

-- TABELA RELAÇÃO PERSONAGENS E ALTERNATIVAS
CREATE TABLE alternativa_personagens_pontos (
	idpontos INT PRIMARY KEY AUTO_INCREMENT,
    fk_alternativas INT,
    fk_personagens INT,
    qtdPontos INT,
    
    CONSTRAINT fkAltPersonagemAlternativa
		FOREIGN KEY (fk_alternativas)
			REFERENCES alternativas(idalternativas),
            
	CONSTRAINT fkAltPersonagemPersonagem
		FOREIGN KEY (fk_personagens)
			REFERENCES personagens(idpersonagens)
);

-- TABELA RESULTADO USUARIO
CREATE TABLE resultado_usuario (
	fk_personagens INT,
    fk_usuario INT,
    pontos INT,
    
    CONSTRAINT fkResultadoPersonagem
		FOREIGN KEY (fk_personagens)
			REFERENCES personagens(idpersonagens),
            
	CONSTRAINT fkResultadoUsuario
		FOREIGN KEY (fk_usuario)
			REFERENCES usuario(idUsuario)
);