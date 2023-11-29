CREATE DATABASE GARAGEM COLETIVA;

\c GARAGEM COLETIVA;

CREATE TABLE Cliente (

    cpf  character (11 ) primary key  not NULL, 
    nome character varying  not null,
    data_nascimento date,
    endereço text not null,
);

INSERT INTO Cliente ( cpf , nome , data_nascimento) VALUES

('1111111111', 'Ronaldinho', 21/02/1997),
('2222222222', ' Beckham', 13/8/1978);

CREATE TABLE Veículos (
    chassi character varying (10) primary key not null,
    placa character (7),
    cor text,
    ano INT,
    veículo_modelo int 
    dono_cpf character varying (11),
    dono_cpf foreign key references Cliente (cpf)
    veiculo_modelo foreign key references modelo ( id_modelo),
);

INSERT INTO Veículos ( chassi, placa, cor , ano , veículo_modelo) VALUES

(' huyj223233', 'hy380h','roxo', 2023,1);

CREATE TABLE modelo (
    id_modelo int PRIMARY KEY NOT NULL,
    descrição text,
    ano_lançamento INT,   
);

INSERT INTO modelo (descrição , ano_lançamento ) VALUES
(' CARRO LINDO SÓ NAO TEM RODAS', 2000),
(' CARRO LINDO SÓ NAO TEM PORTAS',  1998);

CREATE TABLE andar (
    id_andar int PRIMARY KEY,
    numero_vagas INT,
);

INSERT INTO andar ( id_andar, numero_vagas) VALUES
(1,20)
(2,20),
(3,20);


CREATE TABLE vaga (
    id_vaga int PRIMARY KEY,
    id_andar INT
    id_andar foreign KEY references andar ( id_andar),
);
INSERT INTO vaga ( id_vaga, id_andar,) VALUES

(22,1),
(14,2),
(17,4);

CREATE TABLE ocupação_Vaga (
    id_ocupação int primary KEY,
    id_vaga int ,
    chassi_veiculo varchar (17),
    data_entrada date,
    hora_entrada TIME,
    data_saida date,
    hora_saida time,
    valor money,
    id_vaga foreign key references vaga ( id_vaga),
    chassi_veículo FOREIGN KEY references Veículo (chassi),
);

-- Exiba a placa e o ano do veículo de um determinado veículo : SELECT placa, ano FROM veículos WHERE chassi = huyj223233;
-- Exiba a placa, o ano do veículo do veículo, se ele possuir ano a partir de 2000 : SELECT placa, ano FROM veículos WHERE ano>= 2000;
-- Liste todos os carros do modelo 1 : SELECT FROM veículos WHERE id_modelo = 1;
--Liste todos os estacionamentos de um veículo: