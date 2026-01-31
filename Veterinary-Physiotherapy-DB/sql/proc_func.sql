DROP FUNCTION IF EXISTS total_tratamentos_detalhados_por_terapeuta;

/*O objetivo desta função é calcular e detalhar as informações sobre
 os tratamentos realizados por um terapeuta específico em um intervalo de
 datas fornecido. É retornado o número total de tratamentos realizados,
 o número de animais únicos tratados pelo terapeuta, a quantidade de
 espécies distintas dos animais tratados, a data do tratamento mais recente
 realizado pelo terapeuta*/
CREATE OR REPLACE FUNCTION total_tratamentos_detalhados_por_terapeuta(
   p_num_terapeuta INTEGER,
   p_data_inicio DATE,
   p_data_fim DATE
)
RETURNS TABLE (
   num_total_tratamentos INTEGER,
   num_animais_tratados INTEGER,
   especies_distintas INTEGER,
   tratamento_mais_recente DATE
) AS
$$
BEGIN
RETURN QUERY
   SELECT
      COUNT(*)::INTEGER,
      COUNT(DISTINCT tr.num_animal)::INTEGER,
      COUNT(DISTINCT a.especie)::INTEGER,
      MAX(tr.data_tratamento)::DATE
   FROM
      tratamentos_realizados tr
      JOIN animais a ON tr.num_animal = a.num_animal
   WHERE
      tr.num_terapeuta = p_num_terapeuta
      AND tr.data_tratamento BETWEEN p_data_inicio AND p_data_fim;
END;
$$ LANGUAGE plpgsql;


/*Listar os tratamentos realizados pelo terapeuta identificado pelo número
 6 no intervalo de datas de 1 de janeiro de 2024 a 31 de dezembro de 2024*/
SELECT
* 
FROM total_tratamentos_detalhados_por_terapeuta(6, '2024-01-01', '2024-12-31');
