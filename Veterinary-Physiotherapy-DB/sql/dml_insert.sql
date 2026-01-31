INSERT INTO
   colaboradores (
      num_colaborador,
      nome,
      genero,
      salario,
      data_nascimento
   )
VALUES
   (
      1,
      'Susana Bond',
      'F',
      1563.87,
      '1998-06-29'
   ),
   (
      2,
      'Carla Garner',
      'F',
      1398.22,
      '1997-08-07'
   ),
   (
      3,
      'Mónica',
      'F',
      1480.47,
      '1999-10-01'
   ),
   (
      4,
      'Odete JiMenez',
      'F',
      1084.38,
      '1993-12-29'
   ),
   (
      5,
      'Clotilde Nolan',
      'F',
      1083.21,
      '1996-03-08'
   ),
   (
      6,
      'Rui RichMond',
      'M',
      3935.57,
      '2001-09-07'
   ),
   (
      7,
      'Adalberto GilMore',
      'M',
      2354.90,
      '1997-01-02'
   ),
   (
      8,
      'Suzete Wilder',
      'F',
      4445.75,
      '2005-03-26'
   ),
   (
      9,
      'JoseFina Gordon',
      'F',
      6485.83,
      '2003-06-27'
   ),
   (
      10,
      'Antonieta Horn',
      'O',
      4643.31,
      '2003-04-06'
   ),
   (
      11,
      'Isidoro Martinez',
      'M',
      4741.77,
      '1992-09-08'
   ),
   (
      12,
      'Messias Duncan',
      'M',
      9680.94,
      '1994-02-25'
   );

INSERT INTO
   rececionistas (num_colaborador, telefone, chefiado_por, chefe)
VALUES
   (1, '08002415433', NULL, TRUE),
   (2, '08002415433', 1, FALSE),
   (3, '08002415433', 1, FALSE);

INSERT INTO
   limpeza (num_colaborador)
VALUES
   (4),
   (9);

INSERT INTO
   veterinarios (num_colaborador, especialidade, num_cedula)
VALUES
   (6, 'Ortopedia', 383744018),
   (7, 'Lesões neurológicas', 447663768),
   (
      8,
      'Musculo esquelética',
      87324768
   ),
   (9, 'Musculo esquelética', 134390268),
   (10, 'Pós-operatório', 223610089),
   (11, 'Cardio respiratória', 847994518),
   (12, 'Ortopedia', 943213723);

INSERT INTO
   terapeutas (num_colaborador)
VALUES
   (6),
   (7),
   (8),
   (9),
   (10),
   (11);

INSERT INTO
   diretor_clinico (num_colaborador)
VALUES
   (12);

INSERT INTO
   clientes (num_cliente, nome, endereco, email)
VALUES
   (
      1,
      'Iliana Harper',
      'Ap #509-6179 Dictum Rd.',
      'yetiyim297@jonespal.com'
   ),
   (
      2,
      'Amelia Schroeder',
      'Ap #566-8199 Nascetur Street',
      'egetr3j97@jonespal.com'
   ),
   (
      3,
      'Wayne Garza',
      'Ap #942-1926 Pellentesque St',
      'arefoim@sapo.pt'
   ),
   (
      4,
      'Adrian Winters',
      'Ap #252-2112 Arcu. St.',
      'ewfuih208@gmail.com'
   );

INSERT INTO
   cliente_telefone (num_cliente, telefone)
VALUES
   (1, '0500471337'),
   (1, '08001111'),
   (2, '08000755232'),
   (2, '8699837'),
   (2, '14252843882'),
   (3, '17248848966'),
   (4, '1742352414');

INSERT INTO
   animais (
      num_animal,
      nome,
      especie,
      historico_medico,
      seguro,
      data_nascimento,
      num_cliente
   )
VALUES
   (
      1,
      'Blaze',
      'Pan paniscus',
      'tensão muscular no membro superior',
      TRUE,
      '2015-05-12',
      1
   ),
   (
      2,
      'Luna',
      'Canis lupus familiaris',
      'vacinação completa; alergia alimentar detetada',
      TRUE,
      '2020-02-14',
      2
   ),
   (
      3,
      'Max',
      'Felis catus',
      'tratamento para infeção urinária',
      FALSE,
      '2018-11-03',
      3
   ),
   (
      4,
      'Ruby',
      'Equus ferus caballus',
      'lesão no casco esquerdo',
      FALSE,
      '2012-07-21',
      4
   ),
   (
      5,
      'Buddy',
      'Ara ararauna',
      'fratura no bico; recuperação completa',
      FALSE,
      '2019-03-15',
      4
   ),
   (
      6,
      'Charlie',
      'Cavia porcellus',
      'tratamento para ácaros',
      TRUE,
      '2021-09-10',
      2
   ),
   (
      7,
      'Daisy',
      'Oryctolagus cuniculus',
      'vacinação completa',
      TRUE,
      '2022-06-08',
      4
   ),
   (
      8,
      'Simba',
      'Panthera leo',
      'tratamento dentário',
      FALSE,
      '2010-12-25',
      4
   ),
   (
      9,
      'Jo',
      'Psittacus erithacus',
      'tratamento para stress',
      FALSE,
      '2016-10-04',
      2
   ),
   (
      10,
      'Bella',
      'Bos taurus',
      'tratamento para infeção no ouvido',
      TRUE,
      '2017-01-18',
      2
   ),
   (
      11,
      'Jimmy',
      'Panthera leo',
      'vacinação completa',
      TRUE,
      '2020-01-22',
      4
   );

INSERT INTO
   planos_intervencao(
      num_plano,
      tipo_tratamento,
      data_inicio,
      data_fim_prevista
   )
VALUES
   (
      1,
      'Reabilitação pós-operatória',
      '2024-11-01',
      '2024-12-15'
   ),
   (
      2,
      'Hidroterapia para fortalecimento muscular',
      '2024-10-15',
      '2024-11-10'
   ),
   (
      3,
      'Fisioterapia para lesão ortopédica',
      '2024-09-20',
      '2024-12-01'
   ),
   (
      4,
      'Tratamento para stresse animal',
      '2024-12-01',
      '2024-12-15'
   ),
   (
      5,
      'Vacinação completa',
      '2024-01-20',
      '2024-11-20'
   ),
   (
      6,
      'Tratamento dentário',
      '2024-12-05',
      '2024-12-15'
   ),
   (
      7,
      'Cuidados intensivos pós-operatórios',
      '2024-08-01',
      '2024-09-01'
   ),
   (
      8,
      'Fisioterapia cardio-respiratória',
      '2024-09-15',
      '2024-11-15'
   ),
   (
      9,
      'Terapia ocupacional para animais idosos',
      '2024-07-10',
      '2024-10-10'
   ),
   (
      10,
      'Tratamento de alergias alimentares',
      '2024-08-10',
      '2024-11-15'
   );

INSERT INTO
   consultas(
      num_consulta,
      diagnostico,
      prescricao,
      data_consulta,
      num_colaborador,
      num_animal,
      num_plano
   )
VALUES
   (
      1,
      'Lesão ortopédica no membro posterior',
      'Fisioterapia e repouso',
      '2024-10-15',
      12,
      1,
      1
   ),
   (
      2,
      'Alergia alimentar severa',
      'Mudança na dieta e acompanhamento mensal',
      '2024-10-14',
      12,
      2,
      2
   ),
   (
      3,
      'Infeção urinária recorrente',
      'Antibióticos e controle hídrico',
      '2024-09-05',
      12,
      3,
      3
   ),
   (
      4,
      'Lesão no casco esquerdo',
      'Limpeza, antibióticos e repouso',
      '2024-11-30',
      12,
      4,
      4
   ),
   (
      5,
      'Tratamento pós-fratura no bico',
      'Analgésicos e monitoramento',
      '2024-11-10',
      12,
      5,
      5
   ),
   (
      6,
      'Vacinação anual',
      'Aplicação de vacinas e reforço',
      '2024-11-15',
      12,
      6,
      6
   ),
   (
      7,
      'Tratamento dentário preventivo',
      'Limpeza dentária e ajustes na dieta',
      '2024-07-01',
      12,
      8,
      7
   ),
   (
      8,
      'Stresse crónico',
      'Sessões de reabilitação e calmantes',
      '2024-08-25',
      12,
      9,
      8
   ),
   (
      9,
      'Otite externa',
      'Limpeza auricular e antibióticos tópicos',
      '2024-06-02',
      12,
      10,
      9
   ),
   (
      10,
      'Limpeza',
      'Produto nasal',
      '2024-11-02',
      12,
      1,
      10
   );

INSERT INTO
   ciclos_tratamentos(
      num_ciclo,
      data_inicio_ciclo,
      data_fim_ciclo,
      num_consulta,
      num_plano
   )
VALUES
   (1, '2024-11-01', NULL, 1, 1),
   (2, '2024-10-15', NULL, 2, 2),
   (3, '2024-09-20', NULL, 3, 3),
   (4, '2024-12-01', NULL, 4, 4),
   (5, '2024-11-20', NULL, 5, 5),
   (6, '2024-12-05', NULL, 6, 6),
   (7, '2024-08-01', NULL, 7, 7),
   (8, '2024-09-15', NULL, 8, 8),
   (9, '2024-07-10', NULL, 9, 9),
   (10, '2024-12-10', NULL, 10, 10);

UPDATE
   ciclos_tratamentos
SET
   data_fim_ciclo = CASE
      WHEN num_ciclo = 2 THEN '2024-11-24' :: DATE
      WHEN num_ciclo = 4 THEN '2024-12-25' :: DATE
      WHEN num_ciclo = 6 THEN '2024-12-26' :: DATE
      WHEN num_ciclo = 9 THEN '2024-08-16' :: DATE
      WHEN num_ciclo = 10 THEN '2024-12-14' :: DATE
   END;

INSERT INTO
   tratamentos_planeados(num_tratamento, num_total_tratamentos, num_ciclo)
VALUES
   (1, 10, 1),
   (2, 8, 2),
   (3, 15, 3),
   (4, 6, 4),
   (5, 12, 5),
   (6, 20, 6),
   (7, 5, 7),
   (8, 18, 8),
   (9, 25, 9),
   (10, 10, 10),
   (11, 4, 1),
   (12, 7, 2),
   (13, 5, 3),
   (14, 3, 4),
   (15, 2, 5),
   (16, 1, 6);

INSERT INTO
   tratamentos_realizados(
      num_tratamento,
      descricao,
      data_tratamento,
      num_animal,
      num_terapeuta
   )
VALUES
   (
      1,
      'Sessão inicial de fisioterapia',
      '2024-11-01',
      1,
      6
   ),
   (
      2,
      'Hidroterapia de fortalecimento',
      '2024-10-20',
      2,
      7
   ),
   (
      3,
      'Sessão de fisioterapia ortopédica',
      '2024-09-25',
      3,
      6
   ),
   (4, 'Tratamento anti-stress', '2024-12-03', 9, 8),
   (5, 'Reforço de vacinação', '2024-11-20', 6, 6),
   (6, 'Procedimento dentário', '2024-12-05', 8, 10),
   (
      7,
      'Cuidados pós-operatórios',
      '2024-08-05',
      4,
      6
   ),
   (
      8,
      'Terapia cardio-respiratória',
      '2024-09-20',
      10,
      9
   ),
   (
      9,
      'Terapia ocupacional inicial',
      '2024-07-15',
      5,
      8
   ),
   (10, 'Ajustes alimentares', '2024-12-12', 2, 7),
   (
      11,
      'Probióticos para suporte gastrointestina',
      '2024-12-13',
      2,
      6
   ),
   (
      12,
      'Dieta hipoalergênica com proteína hidrolisada',
      '2024-12-14',
      2,
      8
   ),
   (
      13,
      'Suplementação com ácidos graxos ômega -3',
      '2024-12-15',
      2,
      9
   ),
   (
      14,
      'Corticosteroides para controle de inflamação',
      '2024-12-16',
      2,
      10
   ),
   (
      15,
      'Imunoterapia alimentar personalizada',
      '2024-12-17',
      2,
      10
   ),
   (
      16,
      'Antihistamínicos para alívio dos sintomas',
      '2024-12-18',
      2,
      11
   );
