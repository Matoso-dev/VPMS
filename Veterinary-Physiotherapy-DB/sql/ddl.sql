DROP TABLE IF EXISTS clientes CASCADE;

DROP TABLE IF EXISTS consultas CASCADE;

DROP TABLE IF EXISTS rececionistas CASCADE;

DROP TABLE IF EXISTS cliente_telefone CASCADE;

DROP TABLE IF EXISTS limpeza CASCADE;

DROP TABLE IF EXISTS terapeutas CASCADE;

DROP TABLE IF EXISTS diretor_clinico CASCADE;

DROP TABLE IF EXISTS veterinarios CASCADE;

DROP TABLE IF EXISTS colaboradores CASCADE;

DROP TABLE IF EXISTS animais CASCADE;

DROP TABLE IF EXISTS planos_intervencao CASCADE;

DROP TABLE IF EXISTS ciclos_tratamentos CASCADE;

DROP TABLE IF EXISTS tratamentos_planeados CASCADE;

DROP TABLE IF EXISTS tratamentos_realizados CASCADE;

CREATE TABLE colaboradores(
   num_colaborador INTEGER,
   nome VARCHAR(100) CONSTRAINT NN_COLABORADORES_NOME NOT NULL,
   genero CHAR,
   CONSTRAINT CK_COLABORADORES_GENERO CHECK (genero IN ('M', 'F', 'O')),
   salario NUMERIC(8, 2) CONSTRAINT NN_COLABORADORES_SALARIO NOT NULL,
   data_nascimento DATE CONSTRAINT NN_DATA_NASCIMENTO NOT NULL,
   CONSTRAINT PK_COLABORADORES_NUM_COLABORADOR PRIMARY KEY (num_colaborador),
   CONSTRAINT CK_COLABORADORES_SALARIO CHECK (salario > 900)
);

CREATE TABLE rececionistas(
   num_colaborador INTEGER,
   telefone VARCHAR(15),
   chefiado_por INTEGER,
   chefe BOOLEAN CONSTRAINT NN_RECECIONISTAS_CHEFE NOT NULL,
   CONSTRAINT PK_RECECIONISTA_NUM_COLABORADOR PRIMARY KEY (num_colaborador),
   CONSTRAINT FK_RECECIONISTAS2COLABORADORES FOREIGN KEY (num_colaborador) REFERENCES colaboradores(num_colaborador),
   CONSTRAINT FK_RECECIONISTA_CHEFIADO_POR FOREIGN KEY (chefiado_por) REFERENCES rececionistas(num_colaborador),
   CONSTRAINT CK_RECECIONISTAS_CHEFE CHECK (
      (
         chefe = TRUE
         AND chefiado_por IS NULL
      )
      OR (
         chefe = FALSE
         AND chefiado_por IS NOT NULL
      )
   )
);

CREATE TABLE limpeza(
   num_colaborador INTEGER,
   CONSTRAINT PK_LIMPEZA_NUM_COLABORADOR PRIMARY KEY (num_colaborador),
   CONSTRAINT FK_LIMPEZA2COLABORADORES FOREIGN KEY (num_colaborador) REFERENCES colaboradores(num_colaborador)
);

CREATE TABLE veterinarios (
   num_colaborador INTEGER,
   especialidade VARCHAR(50) CONSTRAINT NN_VETERINARIOS_ESPECIALIDADE NOT NULL,
   num_cedula INTEGER CONSTRAINT NN_VETERINARIOS_CEDULA NOT NULL,
   CONSTRAINT PK_VETERINARIO_NUM_COLABORADOR PRIMARY KEY (num_colaborador),
   CONSTRAINT FK_VETERINARIO2COLABORADORES FOREIGN KEY (num_colaborador) REFERENCES colaboradores(num_colaborador),
   CONSTRAINT UK_NUM_CEDULA UNIQUE (num_cedula)
);
	
CREATE TABLE terapeutas(
   num_colaborador INTEGER,
   CONSTRAINT PK_TERAPEUTA_NUM_COLABORADOR PRIMARY KEY(num_colaborador),
   CONSTRAINT FK_TERAPEUTAS2VETERINARIOS FOREIGN KEY (num_colaborador) REFERENCES veterinarios(num_colaborador)
);

CREATE TABLE diretor_clinico(
   num_colaborador INTEGER,
   CONSTRAINT PK_DIRETOR_NUM_COLABORADOR PRIMARY KEY(num_colaborador),
   CONSTRAINT FK_DIRETOR2VETERINARIO FOREIGN KEY (num_colaborador) REFERENCES veterinarios(num_colaborador)
);

CREATE TABLE clientes(
   num_cliente INTEGER,
   nome VARCHAR(100) CONSTRAINT NN_CLIENTES_NOME NOT NULL,
   endereco VARCHAR(100),
   email VARCHAR(50),
   CONSTRAINT PK_CLIENTES_NUM_CLIENTE PRIMARY KEY(num_cliente)
);

CREATE TABLE cliente_telefone(
   num_cliente INTEGER,
   telefone VARCHAR(20) CONSTRAINT NN_CLIENTES_TELEFONE_TELEFONE NOT NULL,
   CONSTRAINT PK_CLIENTE_TELEFONE PRIMARY KEY(num_cliente, telefone),
   CONSTRAINT FK_TELEFONE_TELEFONE FOREIGN KEY(num_cliente) REFERENCES clientes (num_cliente) ON DELETE CASCADE
);

CREATE TABLE animais(
   num_animal INTEGER,
   nome VARCHAR(100) CONSTRAINT NN_ANIMAIS_NOME NOT NULL,
   especie VARCHAR(50),
   historico_medico VARCHAR(500),
   seguro BOOLEAN,
   data_nascimento DATE CONSTRAINT NN_DATA_NASCIMENTO NOT NULL,
   num_cliente INTEGER CONSTRAINT NN_ANIMAIS_NUM_CLIENTE NOT NULL, 
   CONSTRAINT PK_ANIMAIS_NUM_ANIMAL PRIMARY KEY(num_animal),
   CONSTRAINT FK_ANIMAIS2CLIENTES FOREIGN KEY (num_cliente) REFERENCES clientes(num_cliente)
);

CREATE TABLE planos_intervencao(
   num_plano INTEGER,
   tipo_tratamento VARCHAR(50),
   data_inicio DATE CONSTRAINT NN_PLANO_DATA_INICIO NOT NULL,
   data_fim_prevista DATE CONSTRAINT NN_PLANO_DATA_FIM NOT NULL,
   CONSTRAINT CK_DATA_PLANOS CHECK (data_inicio <= data_fim_prevista),
   CONSTRAINT PK_PLANOS_NUM_PLANO PRIMARY KEY(num_plano)
);

CREATE TABLE consultas(
   num_consulta INTEGER,
   diagnostico VARCHAR(100) CONSTRAINT NN_CONSULTAS_DIAGNOSTICO NOT NULL,
   prescricao VARCHAR(500),
   data_consulta DATE CONSTRAINT NN_DATA_CONSULTA NOT NULL,
   num_colaborador INTEGER CONSTRAINT NN_CONSULTAS_NUM_COLABORADOR NOT NULL,
   num_animal INTEGER CONSTRAINT NN_CONSULTAS_NUM_ANIMAL NOT NULL,
   num_plano INTEGER,
   CONSTRAINT PK_CONSULTAS_NUM_CONSULTA PRIMARY KEY(num_consulta),
   -- FK para o Diretor Clinico (único)
   CONSTRAINT FK_CONSULTAS2DIRETOR FOREIGN KEY(num_colaborador) references diretor_clinico(num_colaborador),
   CONSTRAINT FK_CONSULTAS2ANIMAL FOREIGN KEY (num_animal) REFERENCES animais(num_animal),
   CONSTRAINT FK_CONSULTAS2PLANO FOREIGN KEY (num_plano) REFERENCES planos_intervencao(num_plano)
);

CREATE TABLE ciclos_tratamentos(
   num_ciclo INTEGER,
   data_inicio_ciclo DATE CONSTRAINT NN_CONSULTAS_DATA_INICIO NOT NULL,
   --data_fim é preenchida quando acabar o ciclo
   data_fim_ciclo DATE,
   num_consulta INTEGER CONSTRAINT NN_CICLO_NUM_CONSULTA NOT NULL,
   num_plano INTEGER CONSTRAINT NN_CICLO_NUM_PLANO NOT NULL,
   CONSTRAINT CK_DATA_CICLO CHECK (data_inicio_ciclo <= data_fim_ciclo),
   CONSTRAINT PK_CICLOS_TRATAMENTOS PRIMARY KEY (num_ciclo),
   CONSTRAINT FK_CICLO2CONSULTAS FOREIGN KEY (num_consulta) REFERENCES consultas(num_consulta),
   CONSTRAINT UK_NUM_CONSULTA UNIQUE (num_consulta),
   CONSTRAINT FK_CICLO2PLANOS FOREIGN KEY (num_plano) REFERENCES planos_intervencao(num_plano)
);

CREATE TABLE tratamentos_planeados(
   num_tratamento INTEGER,
   num_total_tratamentos INTEGER,
   num_ciclo INTEGER CONSTRAINT NN_TRATAMENTOS_PLANEADOS_NUM_CICLO NOT NULL,
   CONSTRAINT PK_TRATAMENTO_PLANEADOS PRIMARY KEY (num_tratamento),
   CONSTRAINT FK_TRATAMENTOS2CICLO FOREIGN KEY (num_ciclo) REFERENCES ciclos_tratamentos(num_ciclo)
);

CREATE TABLE tratamentos_realizados(
   num_tratamento INTEGER,
   descricao VARCHAR(500),
   data_tratamento DATE CONSTRAINT NN_DATA_TRATAMENTO NOT NULL,
   num_animal INTEGER,
   num_terapeuta INTEGER,
   CONSTRAINT PK_TRATAMENTO_NUM_TRATAMENTO PRIMARY KEY (
      num_tratamento,
      num_animal,
      num_terapeuta
   ),
   CONSTRAINT FK_TRATAMENTOS_REALIZADOS2TRATAMENTOS_PLANEADOS FOREIGN KEY (num_tratamento) REFERENCES tratamentos_planeados(num_tratamento),
   CONSTRAINT FK_TRATAMENTOS_REALIZADOS2ANIMAL FOREIGN KEY (num_animal) REFERENCES animais(num_animal),
   CONSTRAINT FK_TRATAMENTOS_REALIZADOS2TERAPEUTA FOREIGN KEY (num_terapeuta) REFERENCES terapeutas(num_colaborador)
);

CREATE OR REPLACE FUNCTION verifica_diretor()
RETURNS TRIGGER AS 
$$
BEGIN
	IF EXISTS (
		SELECT 1
		FROM diretor_clinico
	)
	THEN
		RAISE EXCEPTION 'Só pode existir um Diretor Clinico';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_diretor_clinico
BEFORE INSERT ON diretor_clinico
FOR EACH ROW
EXECUTE FUNCTION verifica_diretor();

CREATE OR REPLACE FUNCTION verifica_disjuncao_terapeuta()
RETURNS TRIGGER AS 
$$
BEGIN
		IF EXISTS(
			SELECT 1 
			FROM diretor_clinico
			WHERE diretor_clinico.num_colaborador = NEW.num_colaborador
		) THEN 
			RAISE EXCEPTION 'Este veterinário é o diretor clínico, não exerce funcoes de terapeuta';
		END IF;
		RETURN NEW;
END;
$$ language plpgsql;

CREATE TRIGGER trigger_verificar_disjuncao_terapeutas
BEFORE INSERT OR UPDATE ON terapeutas
FOR EACH ROW 
EXECUTE FUNCTION verifica_disjuncao_terapeuta();

CREATE OR REPLACE FUNCTION verifica_disjuncao_diretor()
RETURNS TRIGGER AS 
$$
BEGIN 
		IF EXISTS (
			SELECT 1 
			FROM terapeutas
			WHERE terapeutas.num_colaborador = NEW.num_colaborador
		) THEN 
				RAISE EXCEPTION 'Este veterinário é terapeuta, se foi promovido a Diretor terá que ser primeiramente apagado da tabela de terapeutas.';
		END IF;
		RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_disjuncao_diretor
BEFORE INSERT ON diretor_clinico
FOR EACH ROW
EXECUTE FUNCTION verifica_disjuncao_diretor();