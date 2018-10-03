-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE estado (
sigla_uf varchar(10) PRIMARY KEY,
nome varchar(50)
)
;
CREATE TABLE cidade (
nome varchar(50),
cod_cidade varchar(30) PRIMARY KEY,
sigla_uf varchar(10),
FOREIGN KEY(sigla_uf) REFERENCES estado (sigla_uf)
);

CREATE TABLE juridico (
razao_social varchar(50),
cnpj varchar(80),
cod_juridico number(12) PRIMARY KEY,
cod_usuario number(12)
);

CREATE TABLE fisico (
descricao varchar(250),
especificacao varchar(250),
cpf varchar(50),
cod_fisico Texto(1) PRIMARY KEY,
cod_usuario number(12)
);

CREATE TABLE usuario (
senha varchar(20),
email varchar(50),
nome varchar(80),
cod_usuario number(12) PRIMARY KEY
);

CREATE TABLE estabelecimento (
cep varchar(50),
bairro varchar(25),
rua varchar(80),
nome varchar(80),
complemento varchar(20),
id varchar(30) PRIMARY KEY,
imagem longblob,
cod_juridico number(12),
cod_cidade varchar(30),
FOREIGN KEY(cod_juridico) REFERENCES juridico (cod_juridico),
FOREIGN KEY(cod_cidade) REFERENCES cidade (cod_cidade)
);

CREATE TABLE avaliacao+ (
id varchar(30),
cod_fisico Texto(1),
nota int,
data_hrnota timestamp,
FOREIGN KEY(id) REFERENCES estabelecimento (id),
FOREIGN KEY(cod_fisico) REFERENCES fisico (cod_fisico)
);

CREATE TABLE comentario+ (
id varchar(30),
cod_fisico Texto(1),
comentario varchar(250),
data_hora timestamp,
ativo boolean,
FOREIGN KEY(id) REFERENCES estabelecimento (id),
FOREIGN KEY(cod_fisico) REFERENCES fisico (cod_fisico)
);

ALTER TABLE juridico ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
ALTER TABLE fisico ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
