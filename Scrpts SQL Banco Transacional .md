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

