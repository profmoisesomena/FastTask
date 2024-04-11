-- Apagar tabelas se existirem
DROP TABLE IF EXISTS USUARIO_TAREFA;
DROP TABLE IF EXISTS TAREFA;
DROP TABLE IF EXISTS USUARIO_LOGIN;
DROP TABLE IF EXISTS TIPO_TAREFA ;
DROP TABLE IF EXISTS STATUS_TAREFA;


-- Criação das tabelas
CREATE TABLE USUARIO_LOGIN (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    username VARCHAR(30),
    password VARCHAR(130)
);

CREATE TABLE TIPO_TAREFA (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE TAREFA (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255),
    FK_USUARIO_LOGIN_id INTEGER,
    FK_TIPO_TAREFA_id INTEGER,
    FOREIGN KEY (FK_USUARIO_LOGIN_id) REFERENCES USUARIO_LOGIN(id) ON DELETE CASCADE,
    FOREIGN KEY (FK_TIPO_TAREFA_id) REFERENCES TIPO_TAREFA(id) ON DELETE CASCADE
);

CREATE TABLE STATUS_TAREFA(
    status_tarefa_PK SERIAL PRIMARY KEY,
    status_tarefa VARCHAR(50)
);

CREATE TABLE USUARIO_TAREFA (
    fk_USUARIO_LOGIN_id INTEGER,
    fk_TAREFA_id INTEGER,
    data_conclusao DATE NOT NULL,
    fk_status_tarefa_status_tarefa_PK INTEGER,
    FOREIGN KEY (fk_USUARIO_LOGIN_id) REFERENCES USUARIO_LOGIN(id) ON DELETE SET NULL,
    FOREIGN KEY (fk_TAREFA_id) REFERENCES TAREFA(id) ON DELETE SET NULL,
    FOREIGN KEY (fk_status_tarefa_status_tarefa_PK) REFERENCES status_tarefa(status_tarefa_PK) ON DELETE NO ACTION
);

-- Inserção de dados
INSERT INTO USUARIO_LOGIN (nome, username, password) VALUES
('João Silva', 'joao123', 'senha123'),
('Maria Santos', 'maria456', 'senha456'),
('Pedro Oliveira', 'pedro789', 'senha789'),
('Miguel Correa', 'Mig1010', 'senha10');

INSERT INTO TIPO_TAREFA (descricao) VALUES
('Historia de usuario'),
('EPIC');


INSERT INTO TAREFA (descricao, FK_USUARIO_LOGIN_id, FK_TIPO_TAREFA_id) VALUES
('Desenvolver funcionalidade X', 1, 1),
('Testar funcionalidade Y', 2, 2),
('Revisar documentação', 3, 1),
('Desenvolver CRUD', 3, 2),
('Revisar documentação X', 4, 2);

INSERT INTO status_tarefa (status_tarefa) VALUES
('Em andamento'),
('Concluída'),
('A Fazer');

-- Inserção de mais dados na tabela USUARIO_TAREFA para garantir 10 linhas de resultados
INSERT INTO USUARIO_TAREFA (fk_USUARIO_LOGIN_id, fk_TAREFA_id, data_conclusao, fk_status_tarefa_status_tarefa_PK) VALUES
(1, 1, '2024-03-03', 2),
(2, 1, '2024-03-03', 2),
(3, 1, '2024-03-03', 2),
(4, 1, '2024-03-03', 2),

(2, 2, '2024-02-25', 3),
(1, 2, '2024-02-25', 3),
(3, 2, '2024-02-25', 3),

(3, 3, '2024-02-02', 2),
(4, 3, '2024-02-02', 2),

(4, 4, '2024-03-04', 3),
(4, 5, '2024-03-04', 3);
