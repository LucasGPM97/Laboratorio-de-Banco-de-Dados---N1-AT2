-- Liste os projetos e suas fontes financiadoras, incluindo o nome do projeto 
-- e o nome da fonte financiadora;


SELECT 
    projeto.nome AS Projeto,
    fonte_financiadora.nome AS Financiador
FROM
    projeto
        JOIN
    fonte_financiadora ON projeto.fonte_financiadora_idfonte_financiadora = fonte_financiadora.idfonte_financiadora;

-- Liste os projetos gerenciados pelos departamentos, incluindo o nome do 
-- projeto e o nome do departamento; 

SELECT 
    departamento.nome AS Departamento, projeto.nome AS Projeto
FROM
    projeto
        JOIN
    departamento ON projeto.departamentofilial_departamento_iddepartamento = departamento.iddepartamento
ORDER BY departamento.nome;


-- Liste os pesquisadores presentes na filial "NORTE", incluindo o nome do 
-- pesquisador e a filial do departamento;


SELECT 
    pesquisador.nome_completo AS Pesquisador,
    filial.nome AS Filial
FROM
    pesquisador
        JOIN
    projeto ON pesquisador.projeto_idprojeto = projeto.idprojeto
        JOIN
    filial ON projeto.departamentofilial_filial_idfilial = filial.idfilial
WHERE
    filial.nome = 'NORTE';


-- Liste os pesquisadores presentes na filial "SUL", incluindo o nome do 
-- pesquisador e a filial do departamento; 
    

SELECT 
    pesquisador.nome_completo AS Pesquisador,
    filial.nome AS Filial
FROM
    pesquisador
            JOIN
    projeto ON pesquisador.projeto_idprojeto = projeto.idprojeto
        JOIN
    filial ON projeto.departamentofilial_filial_idfilial = filial.idfilial
WHERE
    filial.nome = 'SUL';


-- Liste o nome e a cidade dos pesquisadores presentes no projeto "Acesso 
-- a Oportunidades", incluindo o nome do pesquisador, a cidade e o nome 
-- do projeto; 

    
SELECT 
    pesquisador.nome_completo AS Pesquisador,
    cidade.nome AS Cidade,
    projeto.nome AS Projeto
FROM
    pesquisador
        JOIN
    projeto ON pesquisador.projeto_idprojeto = projeto.idprojeto
        JOIN
    cidade ON pesquisador.cidade_idcidade = cidade.idcidade
WHERE
    projeto.nome = 'Acesso a Oportunidades';
    

-- Liste o nome do pesquisador, valor da bolsa, nome do projeto e 
-- departamento dos pesquisadores que moram em “Roraima”; 


SELECT 
    pesquisador.nome_completo AS Pesquisador,
    pesquisador.valor_bolsa AS Valor_Bolsa,
    projeto.nome AS Projeto,
    departamento.nome AS Departamento
FROM
    pesquisador
        JOIN
    projeto ON pesquisador.projeto_idprojeto = projeto.idprojeto
        JOIN
    departamento ON projeto.departamentofilial_departamento_iddepartamento = departamento.iddepartamento
        JOIN
    cidade ON pesquisador.cidade_idcidade = cidade.idcidade
        JOIN
    estado ON cidade.estado_idestado = estado.idestado
WHERE
    estado.nome = 'Roraima';
    


-- Liste todos os pesquisadores (pesquisador, valor da bolsa, nome do 
-- projeto, nome do departamento) e sua localização (cidade e estado); 


SELECT 
    pesquisador.nome_completo AS Pesquisador,
    pesquisador.valor_bolsa AS Valor_Bolsa,
    projeto.nome AS Projeto,
    cidade.nome AS Cidade,
    estado.nome AS Estado
FROM
    pesquisador
        JOIN
    projeto ON pesquisador.projeto_idprojeto = projeto.idprojeto
        JOIN
    cidade ON pesquisador.cidade_idcidade = cidade.idcidade
        JOIN
    estado ON cidade.estado_idestado = estado.idestado;



-- Liste o estado que mais possui pesquisadores, apresentando a 
-- quantidade de pesquisadores; 


SELECT 
    estado.nome AS Estado,
    COUNT(pesquisador.idPesquisador) AS Quantidade_Pesquisadores
FROM
    pesquisador
        JOIN
    cidade ON pesquisador.cidade_idcidade = cidade.idcidade
        JOIN
    estado ON cidade.estado_idestado = estado.idestado
GROUP BY
	estado.nome
ORDER BY
	Quantidade_Pesquisadores DESC
LIMIT 1;



-- Liste todos os projetos (nome do projeto, departamento, filial 
-- departamento, fonte financiadora, valor a investir da fonte financiadora e 
-- valor do projeto), considerando a ordem de maior valor a ser investido. 


SELECT 
    projeto.nome AS Projeto,
    departamento.nome AS Departamento,
    filial.nome AS Filial,
    fonte_financiadora.nome AS Financiadora,
    projeto.valor_investimento AS Valor_Investido,
    projeto.valor_projeto AS Valor_Projeto
FROM
    projeto
        JOIN
    fonte_financiadora ON projeto.fonte_financiadora_idfonte_financiadora = fonte_financiadora.idfonte_financiadora
        JOIN
    departamento ON projeto.DepartamentoFilial_departamento_iddepartamento = departamento.idDepartamento
        JOIN
    filial ON projeto.DepartamentoFilial_filial_idfilial = filial.idFilial
ORDER BY
	projeto.valor_investimento DESC;
