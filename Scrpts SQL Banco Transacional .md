# Scripts das Tabelas

## Distribuição Lead

```SQL
CREATE TABLE Distribuicao_Lead (
    id_lead SERIAL PRIMARY KEY,
    id_profissional INT,
    id_procedimento INT,
    data_lead DATE,
    data_do_agendamento DATE,
    modalidade VARCHAR(100),
    origem VARCHAR(50),
    nome_lead VARCHAR(50),
    status_funil VARCHAR(50),
    converteu BOOLEAN,
    valor FLOAT,

    CONSTRAINT fk_lead_profissional
    FOREIGN KEY (id_profissional)
    REFERENCES Profissional(id_profissional)

    CONSTRAINT fk_lead_procedimento
    FOREIGN KEY (id_procedimento)
    REFERENCES Procedimento(id_procedimento)
);
```

## Procedimento

```SQL
CREATE TABLE Procedimento (
    id_procedimento SERIAL PRIMARY KEY,
    preco_base FLOAT,
    custo_produto FLOAT,
    custo_descartaveis FLOAT,
    brinde FLOAT,
    hora_clinica FLOAT,
    imposto_iss FLOAT
);
```

## Categoria das Contas

```SQL
CREATE TABLE Contas_Categoria (
    id_categoria SERIAL PRIMARY KEY,
    categoria VARCHAR(100),
    subcategoria VARCHAR(100)
);
```

## Contas

```SQL
CREATE TABLE Contas (
    id_despesa SERIAL PRIMARY KEY,
    id_categoria INTEGER,
    categoria VARCHAR(100),
    subcategoria VARCHAR(100),
    descricao VARCHAR(500),
    prestador_fornecedor VARCHAR(100),
    data_vencimento DATE,
    valor_pago DOUBLE,
    status_despesa VARCHAR(50),


    CONSTRAINT fk_contas_categorias
    FOREIGN KEY (id_categoria)
    REFERENCES Contas_Categoria(id_categoria)
);
```

## Profissional

```SQL
CREATE TABLE Profissional (
    id_profissional SERIAL PRIMARY KEY,
    nome_profissional VARCHAR(50)
);
```

## Paciente

```SQL
CREATE TABLE Paciente (
    id_paciente SERIAL PRIMARY KEY,
    data_cadastro DATE,
    cpf VARCHAR(20),
    nome_completo VARCHAR(100),
    data_nascimento DATE,
    origem VARCHAR(50),
    telefone VARCHAR(20)
);
```

## Caixa da Clínica

```SQL
CREATE TABLE Caixa (
    id_caixa SERIAL PRIMARY KEY,
    data_atendimento DATE,
    id_profissional INTEGER,
    id_paciente INTEGER,
    id_procedimento INTEGER,
    desconto FLOAT,
    custo_clinica FLOAT,
    tempo_atendimento INTEGER,
    forma_pagamento VARCHAR(50),

    CONSTRAINT fk_caixa_profissional
    FOREIGN KEY (id_profissional)
    REFERENCES Profissional(id_profissional),

    CONSTRAINT fk_caixa_paciente
    FOREIGN KEY (id_paciente)
    REFERENCES Paciente(id_paciente),

    CONSTRAINT fk_caixa_procedimento
    FOREIGN KEY (id_procedimento)
    REFERENCES Procedimento(id_procedimento)
);
```












