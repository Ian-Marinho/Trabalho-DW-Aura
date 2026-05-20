CREATE TABLE dim_cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome_cliente VARCHAR(150),
    data_nascimento DATE,
    data_cadastro DATE
);

CREATE TABLE dim_equipe (
    id_equipe SERIAL PRIMARY KEY,
    profissional VARCHAR(150)
);

CREATE TABLE dim_origem_lead (
    id_origem_lead SERIAL PRIMARY KEY,
    modalidade VARCHAR(100),
    nome_canal VARCHAR(100)
);

CREATE TABLE dim_status_funil (
    id_status_funil SERIAL PRIMARY KEY,
    status_funil VARCHAR(100)
);

CREATE TABLE dim_subcategoria_despesa (
    id_subcategoria_despesa SERIAL PRIMARY KEY,
    sub_categoria VARCHAR(100),
    categoria VARCHAR(100)
);

CREATE TABLE dim_tempo (
    id_tempo INT PRIMARY KEY,
    dia INTEGER,
    mes INTEGER,
    ano INTEGER,
    trimestre INTEGER,
    data_completa DATE,
    dia_semana VARCHAR(30),
    fim_de_semana VARCHAR(10)
);

CREATE TABLE dim_tratamento (
    id_tratamento SERIAL PRIMARY KEY,
    descricao_tratamento VARCHAR(150),
    preco_base_tratamento DECIMAL(10,2),
    qtd_de_sessoes INTEGER
);

CREATE TABLE fato_atendimento (
    dim_tratamento_id_tratamento INTEGER,
    dim_equipe_id_equipe INTEGER,
    dim_cliente_id_cliente INTEGER,
    dim_tempo_id_tempo INTEGER,

    valor_atendimento DECIMAL(10,2),
    desconto DECIMAL(10,2),
    valor_cobrado DECIMAL(10,2),
    duracao_minutos INTEGER,
    valor_produto DECIMAL(10,2),
    valor_descartaveis DECIMAL(10,2),

    FOREIGN KEY (dim_tratamento_id_tratamento)
        REFERENCES dim_tratamento(id_tratamento),

    FOREIGN KEY (dim_equipe_id_equipe)
        REFERENCES dim_equipe(id_equipe),

    FOREIGN KEY (dim_cliente_id_cliente)
        REFERENCES dim_cliente(id_cliente),

    FOREIGN KEY (dim_tempo_id_tempo)
        REFERENCES dim_tempo(id_tempo)
);

CREATE TABLE fato_despesa (
    dim_subcategoria_despesa_id_subcategoria_despesa INTEGER,
    dim_tempo_id_tempo INTEGER,

    valor_despesa DECIMAL(10,2),

    FOREIGN KEY (dim_subcategoria_despesa_id_subcategoria_despesa)
        REFERENCES dim_subcategoria_despesa(id_subcategoria_despesa),

    FOREIGN KEY (dim_tempo_id_tempo)
        REFERENCES dim_tempo(id_tempo)
);

CREATE TABLE fato_lead (
    dim_tempo_id_tempo INTEGER,
    dim_origem_lead_id_origem_lead INTEGER,
    dim_status_funil_id_status_funil INTEGER,
    dim_equipe_id_equipe INTEGER,
    dim_tratamento_id_tratamento INTEGER,

    valor_estimado DECIMAL(10,2),
    quantidade_lead INTEGER,

    FOREIGN KEY (dim_tempo_id_tempo)
        REFERENCES dim_tempo(id_tempo),

    FOREIGN KEY (dim_origem_lead_id_origem_lead)
        REFERENCES dim_origem_lead(id_origem_lead),

    FOREIGN KEY (dim_status_funil_id_status_funil)
        REFERENCES dim_status_funil(id_status_funil),

    FOREIGN KEY (dim_equipe_id_equipe)
        REFERENCES dim_equipe(id_equipe),

    FOREIGN KEY (dim_tratamento_id_tratamento)
        REFERENCES dim_tratamento(id_tratamento)
);