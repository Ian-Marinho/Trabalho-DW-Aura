CREATE TABLE dim_cliente (
  id_cliente INTEGER UNSIGNED NOT NULL,
  nome_cliente VARCHAR NULL,
  data_nascimento DATE NULL,
  data_cadastro DATE NULL,
);

CREATE TABLE dim_equipe (
  id_equipe INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  profissional VARCHAR NULL,
);

CREATE TABLE dim_origem_lead (
  id_origem_lead INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  modalidade VARCHAR NULL,
  nome_canal VARCHAR NULL,
);

CREATE TABLE dim_status_funil (
  id_status_funil INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  status_funil VARCHAR NULL,
);

CREATE TABLE dim_subcategoria_despesa (
  id_subcategoria_despesa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  sub_categoria VARCHAR NULL,
  categoria VARCHAR NULL,
);

CREATE TABLE dim_tempo (
  id_tempo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  dia INTEGER UNSIGNED NULL,
  mes INTEGER UNSIGNED NULL,
  ano INTEGER UNSIGNED NULL,
  trimestre INTEGER UNSIGNED NULL,
  data_completa DATE NULL,
  dia_semana VARCHAR BINARY NULL,
  fim_de_semana VARCHAR BINARY NULL,
);

CREATE TABLE dim_tratamento (
  id_tratamento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao_tratamento VARCHAR NULL,
  preco_base_tratamento DECIMAL NULL,
  qtd_de_sessoes INTEGER UNSIGNED NULL,
);

CREATE TABLE fato_atendimento (
  dim_tratamento_id_tratamento INTEGER UNSIGNED NOT NULL,
  dim_equipe_id_equipe INTEGER UNSIGNED NOT NULL,
  dim_cliente_id_cliente INTEGER UNSIGNED NOT NULL,
  dim_tempo_id_tempo INTEGER UNSIGNED NOT NULL,
  valor_atendimento DECIMAL NULL,
  desconto DECIMAL NULL,
  valor_cobrado DECIMAL NULL,
  duracao_minutos INTEGER UNSIGNED NULL,
  valor_produto DECIMAL NULL,
  valor_descartaveis DECIMAL NULL,
);

CREATE TABLE fato_despesa (
  dim_subcategoria_despesa_id_subcategoria_despesa INTEGER UNSIGNED NOT NULL,
  dim_tempo_id_tempo INTEGER UNSIGNED NOT NULL,
  valor_despesa DECIMAL NULL,
);

CREATE TABLE fato_lead (
  dim_tempo_id_tempo INTEGER UNSIGNED NOT NULL,
  dim_origem_lead_id_origem_lead INTEGER UNSIGNED NOT NULL,
  dim_status_funil_id_status_funil INTEGER UNSIGNED NOT NULL,
  dim_equipe_id_equipe INTEGER UNSIGNED NOT NULL,
  dim_tratamento_id_tratamento INTEGER UNSIGNED NOT NULL,
  valor_estimado DECIMAL NOT NULL AUTO_INCREMENT,
  quantidade_lead INTEGER UNSIGNED NULL,
);


