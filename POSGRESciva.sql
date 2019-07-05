CREATE DATABASE empresabus2;

SELECT * FROM empresa_p;
SELECT * FROM reserva_p;
SELECT * FROM unidades_p;
SELECT * FROM rutas_p;


CREATE SEQUENCE clientes_p_seq;


CREATE SEQUENCE empresa_p_seq;

CREATE TABLE empresa_p
(
codigo_emp INT DEFAULT NEXTVAL ('empresa_p_seq'),
perfil_emp VARCHAR(200),
nombre_emp VARCHAR(30),
ruck_emp VARCHAR(30),
direccion_emp VARCHAR(30),
telefono_emp VARCHAR(30),
valoracion INT,
CONSTRAINT pk_codigo_emp PRIMARY KEY (codigo_emp)
);

CREATE SEQUENCE unidades_p_seq;

CREATE TABLE unidades_p
(
codigo_uni INT DEFAULT NEXTVAL ('unidades_p_seq'),
codigo_em INT,
perfil_uni VARCHAR(200),
placa_uni VARCHAR(30),
aciento_uni INT,
modelo_uni VARCHAR(30),
estado_uni VARCHAR(20),
CONSTRAINT pk_codigo_uni PRIMARY KEY (codigo_uni),
CONSTRAINT fk_codigo_em FOREIGN KEY(codigo_em) REFERENCES empresa_p(codigo_emp) ON DELETE CASCADE
);


CREATE SEQUENCE rutas_p_seq;

CREATE TABLE rutas_p
(
codigo_dis INT DEFAULT NEXTVAL ('rutas_p_seq'),
codigo_un INT,
origen_dis VARCHAR(25),
destino_dis VARCHAR(25),
fecha_dia_dis VARCHAR(25),
estado_dis VARCHAR(20),
hora_dis VARCHAR(20),
tarifa_dis DOUBLE PRECISION,
CONSTRAINT pk_codigo_dis PRIMARY KEY (codigo_dis),
CONSTRAINT fk_codigo_un FOREIGN KEY(codigo_un) REFERENCES unidades_p(codigo_uni) ON DELETE CASCADE
);

CREATE SEQUENCE reservar_p_seq;

CREATE TABLE reservar_p
(
codigo_res INT DEFAULT NEXTVAL ('reservar_p_seq'),
codigo_bus INT,
codigo_cl INT,
estado_res VARCHAR(25),
fecha_res VARCHAR(20),
CONSTRAINT pk_codigo_res PRIMARY KEY (codigo_res),
CONSTRAINT fk_codigo_bus FOREIGN KEY(codigo_bus) REFERENCES unidades_p(codigo_uni) ON DELETE CASCADE
);


