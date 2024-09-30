CREATE DATABASE pesquisas;

USE pesquisas;

CREATE TABLE fonte_financiadora (
    idfonte_financiadora INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE estado (
    idEstado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    sigla VARCHAR(2) NOT NULL UNIQUE
);

CREATE TABLE cidade (
    idcidade INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    Estado_idEstado INT UNSIGNED NOT NULL,
    FOREIGN KEY (Estado_idEstado)
        REFERENCES estado (idestado)
);

CREATE TABLE Departamento (
    idDepartamento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Filial (
    idFilial INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome ENUM('SUL', 'SUDESTE', 'NORTE', 'NORDESTE', 'CENTRO OESTE') NOT NULL
);

CREATE TABLE DepartamentoFilial (
    Departamento_idDepartamento INT UNSIGNED NOT NULL,
    Filial_idFilial INT UNSIGNED NOT NULL,
    PRIMARY KEY (Filial_idFilial , Departamento_idDepartamento),
    FOREIGN KEY (Filial_idFilial)
        REFERENCES Filial (idFilial),
    FOREIGN KEY (Departamento_idDepartamento)
        REFERENCES Departamento (idDepartamento)
);

CREATE TABLE Projeto (
    idProjeto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor_projeto DOUBLE NOT NULL DEFAULT 0 CHECK (valor_projeto >= 0),
    valor_investimento DOUBLE NOT NULL DEFAULT 0 CHECK (valor_investimento >= 0),
    fonte_financiadora_idfonte_financiadora INT UNSIGNED NOT NULL,
    DepartamentoFilial_filial_idfilial INT UNSIGNED NOT NULL,
    DepartamentoFilial_departamento_iddepartamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (DepartamentoFilial_Filial_idFilial , DepartamentoFilial_Departamento_idDepartamento)
        REFERENCES DepartamentoFilial (Filial_idFilial , Departamento_idDepartamento)
);

CREATE TABLE Pesquisador (
    idPesquisador INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    status ENUM('ATIVO', 'INATIVO') NOT NULL DEFAULT 'ATIVO',
    valor_bolsa DOUBLE NOT NULL DEFAULT 0 CHECK (valor_bolsa >= 0),
    Projeto_idProjeto INT UNSIGNED NOT NULL,
    Cidade_idCidade INT UNSIGNED NOT NULL,
    FOREIGN KEY (Projeto_idProjeto)
        REFERENCES projeto (idProjeto),
    FOREIGN KEY (Cidade_idCidade)
        REFERENCES cidade (idCidade)
);

-- DROP DATABASE pesquisas;
