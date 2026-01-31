/*Q.1: Obter os nomes dos animais que têm uma consulta num dia específico*/
SELECT
   a.nome
FROM
   animais a,
   consultas c
WHERE
   c.num_animal = a.num_animal
   AND c.data_consulta = '2024-10-15';

/*Q.2: Obter o número de tratamentos realizados por cada terapeuta depois
 da data 2024-09-13 */
SELECT
   t.num_colaborador,
   COUNT(tr.num_tratamento) AS num_total_tratamentos
FROM
   tratamentos_realizados tr,
   terapeutas t
WHERE
   tr.num_terapeuta = t.num_colaborador
   AND tr.data_tratamento >= '2024-09-13'
GROUP BY
   t.num_colaborador;

/*Q.3: Obter os veterinarios por especialidade com salário médio
 superior a 5000*/
SELECT
   v.especialidade,
   AVG(c.salario) AS avg_salario
FROM
   colaboradores c,
   veterinarios v
WHERE
   c.num_colaborador = v.num_colaborador
GROUP BY
   v.especialidade
HAVING
   AVG(c.salario) > 5000;

/*Q.4: Obter os números, os nomes dos animais e os tratamentos
 realizados para cada um, incluindo animais que não possuem tratamentos*/
SELECT
   a.num_animal,
   a.nome,
   tr.num_tratamento,
   tr.data_tratamento
FROM
   animais a
   LEFT OUTER JOIN tratamentos_realizados tr ON a.num_animal = tr.num_animal;

/*Q.5: Obter os nomes dos animais que tiveram consultas realizadas apenas
 após 2024-11-21*/
SELECT
   a.nome
FROM
   animais a
WHERE
   a.num_animal IN (
      SELECT
         c.num_animal
      FROM
         consultas c
      WHERE
         c.data_consulta > '2024-11-21'
   );

/*Q.6: Obter o número dos veterinários, que realizaram mais de 1
 tratamento, juntamente com o número total de tratamentos de cada um */
WITH consulta_por_veterinario AS (
   SELECT
      tr.num_terapeuta,
      COUNT(tr.num_tratamento) AS num_total_tratamentos_realizados
   FROM
      tratamentos_realizados tr
   GROUP BY
      tr.num_terapeuta
)
SELECT
   num_terapeuta,
   num_total_tratamentos_realizados
FROM
   consulta_por_veterinario
WHERE
   num_total_tratamentos_realizados > 1;

/*Q.7: Listar os animais que nunca tiveram consultas */
SELECT
   a.nome
FROM
   animais a
WHERE
   NOT EXISTS(
      SELECT
         1
      FROM
         consultas c
      WHERE
         a.num_animal = c.num_animal
   );

/*Q.8: Listar o número do cliente e o nome dos animais que compartilham
 o mesmo dono*/
SELECT
   DISTINCT a1.num_cliente,
   a1.nome
FROM
   animais a1
   JOIN animais a2 ON a1.num_cliente = a2.num_cliente
WHERE
   a1.num_animal <> a2.num_animal;

/*Q.9: Listar o número dos animais, que já realizaram tratamentos com todos
 os terapeutas*/
SELECT
   a.num_animal
FROM
   animais a
WHERE
   NOT EXISTS (
      SELECT
         1
      FROM
         terapeutas t
      WHERE
         NOT EXISTS(
            SELECT
               1
            FROM
               tratamentos_realizados tr
            WHERE
               tr.num_animal = a.num_animal
               AND tr.num_terapeuta = t.num_colaborador
         )
   );

/*Q.10: Listar todos os animais cujos nomes começam com a letra 'B'*/
SELECT
   a.nome
FROM
   animais a
WHERE
   a.nome LIKE 'B%';

/*Q.11: Listar o número e o salário dos colaboradores cujo salário é
 maior que o de todos os terapeutas*/
SELECT
   c.num_colaborador,
   c.salario
FROM
   colaboradores c
WHERE
   c.salario > ALL(
      SELECT
         c1.salario
      FROM
         terapeutas t
         JOIN colaboradores c1 ON t.num_colaborador = c1.num_colaborador
   );

/*Q.12: Listar os nomes dos terapeutas que participaram em tratamentos
 associadas a clientes que possuem mais de dois animais. Para cada
 terapeuta, liste o número total de tratamentos realizados por eles e a
 média dos salários de todos os colaboradores que têm o mesmo género*/
WITH clientes_mais_dois_animais AS(
   SELECT
      a.num_cliente
   FROM
      animais a
   GROUP BY
      num_cliente
   HAVING
      COUNT(a.num_animal) > 2
),
tratamentos_realizados_terapeuta AS(
   SELECT
      tr.num_terapeuta,
      COUNT(*) num_total_tratamentos
   FROM
      tratamentos_realizados tr
      JOIN animais a ON a.num_animal = tr.num_animal
   WHERE
      a.num_cliente IN(
         SELECT
            cmda.num_cliente
         FROM
            clientes_mais_dois_animais cmda
      )
   GROUP BY
      tr.num_terapeuta
),
media_terapeutas_mesmo_genero AS(
   SELECT
      c.genero,
      AVG(c.salario) AS avg_salario
   FROM
      colaboradores c
   GROUP BY
      c.genero
)
SELECT
   c.nome,
   trt.num_total_tratamentos,
   mtmg.avg_salario AS avg_salario_mesmo_genero
FROM
   tratamentos_realizados_terapeuta trt
   JOIN terapeutas t ON t.num_colaborador = trt.num_terapeuta
   JOIN colaboradores c ON c.num_colaborador = t.num_colaborador
   JOIN media_terapeutas_mesmo_genero mtmg ON mtmg.genero = c.genero;
