
CREATE DATABASE sistemaviajesbus
GO

USE sistemaviajesbus
GO

CREATE TABLE personal
(
codigo_per INT IDENTITY(1,1),
nombre_per VARCHAR(30),
apellidos_per VARCHAR(30),
direccion_per VARCHAR(50),
dni_per CHAR(8),
telefono_per CHAR(12),
usuario_per VARCHAR(20),
clave_per VARCHAR(20),
fecha_per DATE
CONSTRAINT pk_codigo_per PRIMARY KEY (codigo_per)
)
GO

CREATE TABLE clientes
(
codigo_cli INT IDENTITY(1,1),
nombre_cli VARCHAR(30),
apellidos_cli VARCHAR(30),
direccion_cli VARCHAR(50),
dni_cli CHAR(8),
telefono_cli CHAR(12),
usuario_cli VARCHAR(20),
clave_cli VARCHAR(20),
fecha_cli DATE
CONSTRAINT pk_codigo_cli PRIMARY KEY (codigo_cli)
)
GO


CREATE TABLE empresa
(
codigo_emp INT IDENTITY(1,1),
perfil_emp VARCHAR(200),
nombre_emp VARCHAR(30),
ruck_emp VARCHAR(30),
direccion_emp VARCHAR(30),
telefono_emp VARCHAR(30),
valoracion INT,
CONSTRAINT pk_codigo_emp PRIMARY KEY (codigo_emp)
)
GO

CREATE TABLE unidades
(
codigo_uni INT IDENTITY(1,1),
codigo_em INT,
nombre_uni VARCHAR(30),
aciento_uni INT,
estado_uni VARCHAR(20),
hora_dis TIME,
tarifa_uni FLOAT,
CONSTRAINT pk_codigo_uni PRIMARY KEY (codigo_uni),
CONSTRAINT fk_codigo_em FOREIGN KEY(codigo_em) REFERENCES empresa(codigo_emp) ON DELETE CASCADE
)
GO


CREATE TABLE disponibilidad
(
codigo_dis INT IDENTITY(1,1),
codigo_un INT,
origen_dis VARCHAR(25),
destino_dis VARCHAR(25),
fecha_dia_dis DATE,
CONSTRAINT pk_codigo_dis PRIMARY KEY (codigo_dis),
CONSTRAINT fk_codigo_un FOREIGN KEY(codigo_un) REFERENCES unidades(codigo_uni) ON DELETE CASCADE
)
GO

CREATE TABLE reservar
(
codigo_res INT IDENTITY(1,1),
codigo_bus INT,
codigo_cl INT,
estado_res VARCHAR(25),
fecha_res DATE,
CONSTRAINT pk_codigo_res PRIMARY KEY (codigo_res),
CONSTRAINT fk_codigo_bus FOREIGN KEY(codigo_bus) REFERENCES unidades(codigo_uni) ON DELETE CASCADE,
CONSTRAINT fk_codigo_cl FOREIGN KEY(codigo_cl) REFERENCES clientes(codigo_cli) ON DELETE CASCADE
)
GO

/*-------------------sotore personal----------------------*/

--CREATE PROCEDURE inserta_clientes
--(
--@nombre_cli VARCHAR(30),
--@apellidos_cli VARCHAR(30),
--@direccion_cli VARCHAR(50),
--@dni_cli CHAR(8),
--@telefono_cli CHAR(12),
--@usuario_cli VARCHAR(20),
--@clave_cli VARCHAR(20),
--@fecha_cli DATE
--)
--AS 
--BEGIN
--INSERT INTO clientes(nombre_cli,apellidos_cli,direccion_cli,dni_cli,telefono_cli,usuario_cli,clave_cli,fecha_cli)
--VALUES(@nombre_cli,@apellidos_cli,@direccion_cli,@dni_cli,@telefono_cli,@usuario_cli,@clave_cli,@fecha_cli)
--END
--GO


--CREATE PROCEDURE editar_clientes
--(
--@codigo_cli INT,
--@nombre_cli VARCHAR(30),
--@apellidos_cli VARCHAR(30),
--@direccion_cli VARCHAR(50),
--@dni_cli CHAR(8),
--@telefono_cli CHAR(12),
--@clave_cli VARCHAR(20)
--)
--AS 
--BEGIN
--UPDATE clientes
--SET nombre_cli = @nombre_cli,apellidos_cli = @apellidos_cli,direccion_cli=@direccion_cli,
--dni_cli=@dni_cli,telefono_cli=@telefono_cli,clave_cli=@clave_cli
--WHERE codigo_cli = @codigo_cli
--END
--GO


--CREATE PROCEDURE eliminar_clientes
--(
--@codigo_cli INT
--)
--AS 
--BEGIN
--DELETE FROM clientes
--WHERE codigo_cli = @codigo_cli
--END
--GO

--CREATE PROCEDURE listar_clientes
--AS
--BEGIN
--SELECT * FROM clientes
--END
--GO

--CREATE PROCEDURE call_clientes
--(
--@codigo_cli INT
--)
--AS
--BEGIN
--SELECT * FROM clientes WHERE codigo_cli = @codigo_cli
--END
--GO


--/*-------------------sotore clientes----------------------*/


CREATE PROCEDURE inserta_clientes
(
@nombre_cli VARCHAR(30),
@apellidos_cli VARCHAR(30),
@direccion_cli VARCHAR(50),
@dni_cli CHAR(8),
@telefono_cli CHAR(12),
@usuario_cli VARCHAR(20),
@clave_cli VARCHAR(20),
@fecha_cli DATE
)
AS 
BEGIN
INSERT INTO clientes(nombre_cli,apellidos_cli,direccion_cli,dni_cli,telefono_cli,usuario_cli,clave_cli,fecha_cli)
VALUES(@nombre_cli,@apellidos_cli,@direccion_cli,@dni_cli,@telefono_cli,@usuario_cli,@clave_cli,@fecha_cli)
END
GO


CREATE PROCEDURE editar_clientes
(
@codigo_cli INT,
@nombre_cli VARCHAR(30),
@apellidos_cli VARCHAR(30),
@direccion_cli VARCHAR(50),
@dni_cli CHAR(8),
@telefono_cli CHAR(12),
@clave_cli VARCHAR(20)
)
AS 
BEGIN
UPDATE clientes
SET nombre_cli = @nombre_cli,apellidos_cli = @apellidos_cli,direccion_cli=@direccion_cli,
dni_cli=@dni_cli,telefono_cli=@telefono_cli,clave_cli=@clave_cli
WHERE codigo_cli = @codigo_cli
END
GO


CREATE PROCEDURE eliminar_clientes
(
@codigo_cli INT
)
AS 
BEGIN
DELETE FROM clientes
WHERE codigo_cli = @codigo_cli
END
GO

CREATE PROCEDURE listar_clientes
AS
BEGIN
SELECT * FROM clientes
END
GO

CREATE PROCEDURE call_clientes
(
@codigo_cli INT
)
AS
BEGIN
SELECT * FROM clientes WHERE codigo_cli = @codigo_cli
END
GO


/*-------------------empresas de buss----------------------*/


CREATE PROCEDURE inserta_empresa
(
@nombre_emp VARCHAR(30),
@perfil_emp VARCHAR(200),
@ruck_emp VARCHAR(30),
@direccion_emp VARCHAR(30),
@telefono_emp VARCHAR(30),
@valoracion INT
)
AS 
BEGIN
INSERT INTO empresa(nombre_emp,perfil_emp,ruck_emp,direccion_emp,telefono_emp,valoracion)
VALUES(@nombre_emp,@perfil_emp,@ruck_emp,@direccion_emp,@telefono_emp,@valoracion)
END
GO

CREATE PROCEDURE editar_empresa
(
@codigo_emp INT,
@nombre_emp VARCHAR(30),
@ruck_emp VARCHAR(30),
@direccion_emp VARCHAR(30),
@telefono_emp VARCHAR(30)
)
AS 
BEGIN
UPDATE empresa
SET nombre_emp = @nombre_emp,ruck_emp =@ruck_emp,direccion_emp=@direccion_emp,telefono_emp=@telefono_emp
WHERE codigo_emp = @codigo_emp
END
GO

CREATE PROCEDURE eliminar_empresa
(
@codigo_emp INT
)
AS 
BEGIN
DELETE FROM empresa
WHERE codigo_emp = @codigo_emp
END
GO

CREATE PROCEDURE listar_empresa
AS 
BEGIN
SELECT * FROM empresa
END
GO

CREATE PROCEDURE call_empresa
(
@codigo_emp INT
)
AS 
BEGIN
SELECT * FROM empresa
WHERE codigo_emp = @codigo_emp
END
GO

/*----------------------------------- buss--------------------------*/


CREATE PROCEDURE inserta_unidades
(
@codigo_em INT,
@nombre_uni VARCHAR(30),
@aciento_uni INT,
@estado_uni VARCHAR(20),
@hora_dis TIME,
@tarifa_uni FLOAT
)
AS 
BEGIN
INSERT INTO unidades(codigo_em,nombre_uni,aciento_uni,estado_uni,hora_dis,tarifa_uni)
VALUES(@codigo_em,@nombre_uni,@aciento_uni,@estado_uni,@hora_dis,@tarifa_uni)
END
GO

CREATE PROCEDURE editar_unidades
(
@codigo_uni INT,
@nombre_uni VARCHAR(30),
@aciento_uni INT,
@tarifa_uni FLOAT
)
AS 
BEGIN
UPDATE unidades
SET nombre_uni=@nombre_uni,aciento_uni=@aciento_uni,tarifa_uni=@tarifa_uni
WHERE codigo_uni = @codigo_uni
END
GO

CREATE PROCEDURE estados_constantes_unidad
(
@codigo_uni INT,
@estado_uni VARCHAR(20),
@hora_dis TIME
)
AS 
BEGIN
UPDATE unidades
SET estado_uni=@estado_uni,hora_dis=@hora_dis
WHERE codigo_uni = @codigo_uni
END
GO


CREATE PROCEDURE eliminar_unidad
(
@codigo_uni INT
)
AS 
BEGIN
DELETE FROM unidades
WHERE codigo_uni = @codigo_uni
END
GO

CREATE PROCEDURE listar_unidad
AS 
BEGIN
SELECT * FROM unidades
END
GO


/*----------------------------------- disponibilidad filtro--------------------------*/


CREATE PROCEDURE inserta_disponibilidad
(
@codigo_un INT,
@origen_dis VARCHAR(25),
@destino_dis VARCHAR(25),
@fecha_dia_dis DATE
)
AS 
BEGIN
INSERT INTO disponibilidad(codigo_un,origen_dis,destino_dis,fecha_dia_dis)
VALUES(@codigo_un,@origen_dis,@destino_dis,@fecha_dia_dis)
END
GO

CREATE PROCEDURE editar_disponibilidad
(
@codigo_un INT,
@origen_dis VARCHAR(25),
@destino_dis VARCHAR(25),
@fecha_dia_dis DATE
)
AS 
BEGIN
UPDATE disponibilidad 
SET origen_dis=@origen_dis,destino_dis=@destino_dis,fecha_dia_dis=@fecha_dia_dis
WHERE codigo_un = @codigo_un
END
GO

/*----------------------------------- rESERVAS--------------------------*/

CREATE TABLE reservar
(
codigo_res INT IDENTITY(1,1),
codigo_bus INT,
codigo_cl INT,
estado_res VARCHAR(25),
fecha_res DATE,
CONSTRAINT pk_codigo_res PRIMARY KEY (codigo_res),
CONSTRAINT fk_codigo_bus FOREIGN KEY(codigo_bus) REFERENCES unidades(codigo_uni) ON DELETE CASCADE,
CONSTRAINT fk_codigo_cl FOREIGN KEY(codigo_cl) REFERENCES clientes(codigo_cli) ON DELETE CASCADE
)
GO

CREATE PROCEDURE inserta_reservar
(
@codigo_bus INT,
@codigo_cl INT,
@estado_res VARCHAR(25),
@fecha_res DATE
)
AS 
BEGIN
INSERT INTO reservar(codigo_bus,codigo_cl,estado_res,fecha_res)
VALUES(@codigo_bus,@codigo_cl,@estado_res,@fecha_res)
END
GO

CREATE PROCEDURE cancela_reserva
(
@codigo_res INT,
@estado_res VARCHAR(25)
)
AS 
BEGIN
UPDATE reservar
SET estado_res=@estado_res
WHERE codigo_res = @codigo_res
END
GO