INSERT INTO Departamento(nome)
VALUES
	('DIDES'),
	('DIRUR'),
	('DIMAC'),
	('DINTE'),
	('DISOC');

INSERT INTO filial(nome)
VALUES
	('SUL'),
    ('SUDESTE'),
    ('NORTE'),
    ('NORDESTE'),
    ('CENTRO OESTE');
    
INSERT INTO departamentofilial(Departamento_idDepartamento, Filial_idFilial)
VALUES
	((SELECT idDepartamento FROM departamento WHERE nome = 'DIDES'),(SELECT idfilial FROM filial WHERE nome = 'NORTE')),
    ((SELECT idDepartamento FROM departamento WHERE nome = 'DIDES'),(SELECT idfilial FROM filial WHERE nome = 'SUL')),
    ((SELECT idDepartamento FROM departamento WHERE nome = 'DIRUR'),(SELECT idfilial FROM filial WHERE nome = 'SUL')),
    ((SELECT idDepartamento FROM departamento WHERE nome = 'DIMAC'),(SELECT idfilial FROM filial WHERE nome = 'NORTE')),
    ((SELECT idDepartamento FROM departamento WHERE nome = 'DIMAC'),(SELECT idfilial FROM filial WHERE nome = 'SUL')),
    ((SELECT idDepartamento FROM departamento WHERE nome = 'DINTE'),(SELECT idfilial FROM filial WHERE nome = 'SUDESTE')),
    ((SELECT idDepartamento FROM departamento WHERE nome = 'DISOC'),(SELECT idfilial FROM filial WHERE nome = 'SUDESTE'));
    
INSERT INTO fonte_financiadora
	(nome)
VALUES
	('BID - Banco Interamericano de Desenvolvimento'),
    ('BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
    ('BANERJ - Banco do Estado do Rio de Janeiro'),
    ('BANESPA - Banco do Estado de São Paulo'),
    ('BDMG - Banco de Desenvolvimento de Minas Gerais');
    
INSERT INTO projeto 
	(nome, valor_projeto, valor_investimento,
    fonte_financiadora_idfonte_financiadora,
    departamentofilial_filial_idfilial,
    departamentofilial_departamento_iddepartamento)
VALUES
	('Acesso a Oportunidades', 15000, 100000, 
    (SELECT idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BID - Banco Interamericano de Desenvolvimento'),
    (SELECT idFilial FROM Filial WHERE nome = 'NORTE'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DIDES')),
    
    ('Brasil em Desenvolvimento', 19000, 30000, 
    (SELECT idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
    (SELECT idFilial FROM Filial WHERE nome = 'SUL'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DIRUR')),
    
    ('Emprego no Turismo', 35000, 100000, 
    (SELECT idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BID - Banco Interamericano de Desenvolvimento'),
    (SELECT idFilial FROM Filial WHERE nome = 'NORTE'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DIMAC')),
   
    ('Mapa das Organizações da Sociedade Civil', 55000, 200000, 
    (SELECT idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
    (SELECT idFilial FROM Filial WHERE nome = 'SUL'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DIMAC')),
   
    ('Observatório de Gestão do Conhecimento', 20000, 50000, 
    (SELECT idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
    (SELECT idFilial FROM Filial WHERE nome = 'SUL'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DIDES')),
   
    ('Atlas da Violência', 45000, 70000, 
    (SELECT idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BANERJ - Banco do Estado do Rio de Janeiro'),
    (SELECT idFilial FROM Filial WHERE nome = 'SUDESTE'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DINTE')),
   
    ('Centro de Pesquisa em Ciência, Tecnologia e Sociedade', 25000, 45000, 
    (Select idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BANESPA - Banco do Estado de São Paulo'),
    (Select idFilial FROM Filial WHERE nome = 'SUDESTE'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DISOC')),
   
    ('Retrato das Desigualdades de Gênero e Raça', 32000, 85000, 
    (Select idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BANESPA - Banco do Estado de São Paulo'),
    (Select idFilial FROM Filial WHERE nome = 'SUDESTE'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DISOC')),
    
    ('Índice de Vulnerabilidade Social', 60000, 120000, 
    (Select idfonte_financiadora FROM fonte_financiadora WHERE nome = 'BDMG - Banco de Desenvolvimento de Minas Gerais'),
    (Select idFilial FROM Filial WHERE nome = 'SUDESTE'),
    (SELECT idDepartamento FROM Departamento WHERE nome = 'DISOC'));
    
    
INSERT INTO pesquisador 
	(nome_completo, status, valor_bolsa, 
    projeto_idprojeto, 
    cidade_idcidade)
VALUES
	('Miguel Silva', 'ATIVO', 3100,
	(SELECT idprojeto FROM projeto WHERE nome = 'Acesso a Oportunidades'),
	(SELECT idcidade FROM cidade WHERE nome = 'Boa Vista' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Roraima'))),
    
    ('Arthur Carvalho', 'ATIVO', 2500,
	(SELECT idprojeto FROM projeto WHERE nome = 'Emprego no Turismo'),
	(SELECT idcidade FROM cidade WHERE nome = 'Palmas' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Tocantins'))),
    
    ('Helena Sousa', 'INATIVO', 4000,
	(SELECT idprojeto FROM projeto WHERE nome = 'Brasil em Desenvolvimento'),
	(SELECT idcidade FROM cidade WHERE nome = 'Porto Alegre' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Rio Grande do Sul'))),
    
    ('Laura Pereira', 'ATIVO', 2500,
	(SELECT idprojeto FROM projeto WHERE nome = 'Mapa das Organizações da Sociedade Civil'),
	(SELECT idcidade FROM cidade WHERE nome = 'Macapa' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Amapa'))),
    
    ('Gabriel Luz', 'ATIVO', 3200,
	(SELECT idprojeto FROM projeto WHERE nome = 'Observatório de Gestão do Conhecimento'),
	(SELECT idcidade FROM cidade WHERE nome = 'Belem' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Para'))),
    
    ('Samuel Santos', 'INATIVO', 2000,
	(SELECT idprojeto FROM projeto WHERE nome = 'Acesso a Oportunidades'),
	(SELECT idcidade FROM cidade WHERE nome = 'Palmas' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Tocantins'))),
    
    ('Maria Oliveira', 'ATIVO', 2500,
	(SELECT idprojeto FROM projeto WHERE nome = 'Acesso a Oportunidades'),
	(SELECT idcidade FROM cidade WHERE nome = 'Boa Vista' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Roraima'))),
    
    ('Alice Rodrigues', 'ATIVO', 3100,
	(SELECT idprojeto FROM projeto WHERE nome = 'Brasil em Desenvolvimento'),
	(SELECT idcidade FROM cidade WHERE nome = 'Florianopolis' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Santa Catarina'))),
    
    ('Bernardo Alves', 'ATIVO', 2000,
	(SELECT idprojeto FROM projeto WHERE nome = 'Mapa das Organizações da Sociedade Civil'),
	(SELECT idcidade FROM cidade WHERE nome = 'Porto Velho' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Rondonia'))),
    
    ('Theo Gomes', 'INATIVO', 2500,
	(SELECT idprojeto FROM projeto WHERE nome = 'Observatório de Gestão do Conhecimento'),
	(SELECT idcidade FROM cidade WHERE nome = 'Rio Branco' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Acre'))),
    
    ('Ailton Santos', 'ATIVO', 3100,
	(SELECT idprojeto FROM projeto WHERE nome = 'Atlas da Violência'),
	(SELECT idcidade FROM cidade WHERE nome = 'Cabo Frio' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Rio de Janeiro'))),
    
    ('Ana Beatriz', 'ATIVO', 2100,
	(SELECT idprojeto FROM projeto WHERE nome = 'Retrato das Desigualdades de Gênero e Raça'),
	(SELECT idcidade FROM cidade WHERE nome = 'Campinas' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'São Paulo'))),
    
    ('Bruno Gomes', 'INATIVO', 3500,
	(SELECT idprojeto FROM projeto WHERE nome = 'Retrato das Desigualdades de Gênero e Raça'),
	(SELECT idcidade FROM cidade WHERE nome = 'Guarulhos' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'São Paulo'))),
    
    ('Leticia Rodrigues', 'ATIVO', 2500,
	(SELECT idprojeto FROM projeto WHERE nome = 'Índice de Vulnerabilidade Social'),
	(SELECT idcidade FROM cidade WHERE nome = 'Belo Horizonte' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'Minas Gerais'))),
    
    ('Vinnicius Silva', 'ATIVO', 2800,
	(SELECT idprojeto FROM projeto WHERE nome = 'Atlas da Violência'),
	(SELECT idcidade FROM cidade WHERE nome = 'São Paulo' and  cidade.Estado_idestado = (SELECT idestado from estado where nome = 'São Paulo')));
   
