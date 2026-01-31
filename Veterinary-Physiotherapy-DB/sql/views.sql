DROP VIEW IF EXISTS vw_consultas_animal;

DROP VIEW IF EXISTS vw_tratamentos_planeados_e_realizados;

/*Vista 1: Listar todas as consultas realizadas para um animal,
 incluindo o diagnóstico, prescrição e data da consulta*/
CREATE
OR REPLACE VIEW vw_consultas_animal AS
SELECT
   a.num_animal,
   a.nome as nome_animal,
   c.diagnostico,
   c.prescricao,
   c.data_consulta
FROM
   consultas c
   JOIN animais a ON c.num_animal = a.num_animal;

/*Exemplo: Listar todas as consultas realizadas dentro de um
 intervalo de tempo específico*/
SELECT
   *
FROM
   vw_consultas_animal
WHERE
   data_consulta BETWEEN '2024-11-01'
   AND '2024-11-30';

/*Vista 2: Listar todos os tratamentos planeados e realizados para
 cada animal, incluindo o número do tratamento, o número total de tratamentos,
 a descrição e a data do tratamento*/
CREATE
OR REPLACE VIEW vw_tratamentos_planeados_e_realizados AS
SELECT
   a.num_animal,
   a.nome AS nome_animal,
   tp.num_tratamento,
   tp.num_total_tratamentos,
   tr.descricao,
   tr.data_tratamento
FROM
   animais a
   LEFT JOIN tratamentos_realizados tr ON a.num_animal = tr.num_animal
   LEFT JOIN tratamentos_planeados tp ON tr.num_tratamento = tp.num_tratamento;

/*Exemplo: Listar todas os tratamentos planeados e realizados dentro de um animal
 específico*/
SELECT
   *
FROM
   vw_tratamentos_planeados_e_realizados
WHERE
   num_animal = 3;
