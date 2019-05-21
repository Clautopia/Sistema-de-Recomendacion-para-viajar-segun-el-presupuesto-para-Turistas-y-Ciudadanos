
CREATE DATABASE sistemaviajesbus
GO

USE sistemaviajesbus
GO
--insert into personal(nombre_per,apellidos_per,direccion_per,dni_per,telefono_per,usuario_per,clave_per,fecha_per) 
--values('car','car','miraflores','123211','412','admin','admin','18/05/2019')
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
perfil_uni VARCHAR(200),
placa_uni VARCHAR(30),
aciento_uni INT,
modelo_uni VARCHAR(30),
estado_uni VARCHAR(20),
CONSTRAINT pk_codigo_uni PRIMARY KEY (codigo_uni),
CONSTRAINT fk_codigo_em FOREIGN KEY(codigo_em) REFERENCES empresa(codigo_emp) ON DELETE CASCADE
)
GO


CREATE TABLE rutas
(
codigo_dis INT IDENTITY(1,1),
codigo_un INT,
origen_dis VARCHAR(25),
destino_dis VARCHAR(25),
fecha_dia_dis VARCHAR(25),
estado_dis VARCHAR(20),
hora_dis VARCHAR(20),
tarifa_dis FLOAT,
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

CREATE PROCEDURE inserta_personal
(
@nombre_per VARCHAR(30),
@apellidos_per VARCHAR(30),
@direccion_per VARCHAR(50),
@dni_per CHAR(8),
@telefono_per CHAR(12),
@usuario_per VARCHAR(20),
@clave_per VARCHAR(20),
@fecha_per DATE
)
AS 
BEGIN
INSERT INTO personal(nombre_per,apellidos_per,direccion_per,dni_per,telefono_per,usuario_per,clave_per,fecha_per)
VALUES(@nombre_per,@apellidos_per,@direccion_per,@dni_per,@telefono_per,@usuario_per,@clave_per,@fecha_per)
END
GO


CREATE PROCEDURE editar_personal
(
@codigo_per INT,
@nombre_per VARCHAR(30),
@apellidos_per VARCHAR(30),
@direccion_per VARCHAR(50),
@dni_per CHAR(8),
@telefono_per CHAR(12),
@clave_per VARCHAR(20)
)
AS 
BEGIN
UPDATE personal
SET nombre_per = @nombre_per,apellidos_per = @apellidos_per,direccion_per=@direccion_per,
dni_per=@dni_per,telefono_per=@telefono_per,clave_per=@clave_per
WHERE codigo_per = @codigo_per
END
GO


CREATE PROCEDURE eliminar_personal
(
@codigo_per INT
)
AS 
BEGIN
DELETE FROM personal
WHERE codigo_per = @codigo_per
END
GO

CREATE PROCEDURE listar_personal
AS
BEGIN
SELECT * FROM personal
END
GO

CREATE PROCEDURE call_personal
(
@codigo_per INT
)
AS
BEGIN
SELECT * FROM personal WHERE codigo_per = @codigo_per
END
GO

CREATE PROCEDURE session_personal
(
@usuario_per VARCHAR(20),
@clave_per VARCHAR(20)
)
AS
BEGIN
SELECT * FROM personal
WHERE usuario_per = @usuario_per AND clave_per = @clave_per
END
GO

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

CREATE PROCEDURE combo_empresa
AS 
BEGIN
SELECT nombre_emp FROM empresa
END
GO

CREATE PROCEDURE codigo_empresa
(
@nombre_emp VARCHAR(30)
)
AS 
BEGIN
SELECT codigo_emp FROM empresa
WHERE nombre_emp = @nombre_emp
END
GO

/*----------------------------------- buss--------------------------*/

CREATE PROCEDURE inserta_unidades
(
@codigo_em INT,
@perfil_uni VARCHAR(200),
@placa_uni VARCHAR(30),
@aciento_uni INT,
@modelo_uni VARCHAR(30),
@estado_uni VARCHAR(20)
)
AS 
BEGIN
INSERT INTO unidades(codigo_em,perfil_uni,placa_uni,aciento_uni,modelo_uni,estado_uni)
VALUES(@codigo_em,@perfil_uni,@placa_uni,@aciento_uni,@modelo_uni,@estado_uni)
END
GO

CREATE PROCEDURE editar_unidades
(
@codigo_uni INT,
@aciento_uni INT,
@modelo_uni VARCHAR(30),
@estado_uni VARCHAR(20)
)
AS 
BEGIN
UPDATE unidades
SET aciento_uni=@aciento_uni,modelo_uni = @modelo_uni,estado_uni = @estado_uni
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

CREATE PROCEDURE call_unidad
(
@codigo_uni INT
)
AS 
BEGIN
SELECT * FROM unidades
WHERE codigo_uni = @codigo_uni
END
GO

CREATE PROCEDURE codigo_unidad
(
@placa_uni VARCHAR(30)
)
AS 
BEGIN
SELECT codigo_uni FROM unidades
WHERE placa_uni = @placa_uni
END
GO

/*----------------------------------- rutas --------------------------*/

CREATE PROCEDURE inserta_rutas
(
@codigo_un INT,
@origen_dis VARCHAR(25),
@destino_dis VARCHAR(25),
@fecha_dia_dis VARCHAR(20),
@estado_dis VARCHAR(20),
@hora_dis VARCHAR(20),
@tarifa_dis FLOAT
)
AS 
BEGIN
INSERT INTO rutas(codigo_un,origen_dis,destino_dis,fecha_dia_dis,estado_dis,hora_dis,tarifa_dis)
VALUES(@codigo_un,@origen_dis,@destino_dis,@fecha_dia_dis,@estado_dis,@hora_dis,@tarifa_dis)
END
GO

CREATE PROCEDURE editar_rutas
(
@codigo_dis INT,
@origen_dis VARCHAR(25),
@destino_dis VARCHAR(25),
@fecha_dia_dis VARCHAR(20),
@hora_dis VARCHAR(20),
@tarifa_dis FLOAT
)
AS 
BEGIN
UPDATE rutas 
SET origen_dis=@origen_dis,destino_dis=@destino_dis,fecha_dia_dis=@fecha_dia_dis
WHERE codigo_dis = @codigo_dis
END
GO

CREATE PROCEDURE rutas_completada
(
@codigo_dis INT,
@estado_dis VARCHAR(20)
)
AS 
BEGIN
UPDATE rutas 
SET estado_dis = @estado_dis
WHERE codigo_dis = @codigo_dis
END
GO

CREATE PROCEDURE eliminar_rutas
(
@codigo_dis INT
)
AS 
BEGIN
DELETE FROM rutas 
WHERE codigo_dis = @codigo_dis
END
GO

CREATE PROCEDURE listar_rutas
AS 
BEGIN
SELECT * FROM rutas
WHERE estado_dis = 'DISPONIBLES'
END
GO

CREATE PROCEDURE call_rutas
(
@codigo_un INT
)
AS 
BEGIN
SELECT * FROM rutas
WHERE codigo_un = @codigo_un
END
GO

/*----------------------------------- rESERVAS--------------------------*/


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


/*------------------------------------------filtros-------------------------*/


CREATE PROCEDURE filtros_index
AS
BEGIN
SELECT 
codigo_uni,
perfil_emp,
nombre_emp,
valoracion,
perfil_uni ,
placa_uni ,
aciento_uni ,
estado_uni ,
hora_dis ,
tarifa_dis,
origen_dis ,
destino_dis ,
fecha_dia_dis 
FROM empresa
INNER JOIN unidades ON unidades.codigo_em = empresa.codigo_emp
INNER JOIN rutas ON rutas.codigo_un = unidades.codigo_uni
END
GO

--WHERE origen_dis = 'Arequipa' AND destino_dis = 'Lima' 
--AND fecha_dia_dis = '2019/08/05'
CREATE PROCEDURE filtros_buscar
(
@origen_dis VARCHAR(30),
@destino_dis VARCHAR(30),
@fecha_dia_dis DATE,
@tarifa_uni FLOAT
)
AS
BEGIN
SELECT 
codigo_uni,
perfil_emp,
nombre_emp,
valoracion,
perfil_uni ,
placa_uni ,
aciento_uni ,
estado_uni ,
hora_dis ,
tarifa_uni,
origen_dis ,
destino_dis ,
fecha_dia_dis 
FROM empresa
INNER JOIN unidades ON unidades.codigo_em = empresa.codigo_emp
INNER JOIN rutas ON rutas.codigo_un = unidades.codigo_uni 
WHERE origen_dis = @origen_dis AND destino_dis = @destino_dis 
AND fecha_dia_dis = @fecha_dia_dis AND tarifa_uni = @tarifa_uni
END
GO