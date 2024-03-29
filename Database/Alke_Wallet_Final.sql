create database Alke_Wallet_Final;
use Alke_Wallet_final;

-- TABLA USUARIOS --
CREATE TABLE IF NOT EXISTS `USUARIOS` (
  `USU_ID` INT PRIMARY KEY NOT NULL auto_increment,
  `USU_NAME` VARCHAR(45) NOT NULL,
  `USU_EMAIL` VARCHAR(45) NOT NULL,
  `USU_PASSWORD` VARCHAR(45) NOT NULL,
  `USU_SALDO` INT NOT NULL
  );
  
  -- TABALA CUENTAS --
CREATE TABLE IF NOT EXISTS `CUENTAS`(
  `CUENTA_ID` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, /* NUMERO DE CUENTA  CON PRIMARY KEY PARA USAR EN TRANSACCION */
  `USU_ID` INT NOT NULL,
  `CUENTA_SALDO` DECIMAL(10,0) NOT NULL,
  `CURR_ID` INT NOT NULL,
  `CUENTA_TIPO` VARCHAR(45) NOT NULL,
  `TRAN_ID` INT
  );
  
  -- TABLA MONEDAS --
  CREATE TABLE IF NOT EXISTS `MONEDAS` (
  `CURR_ID` INT PRIMARY KEY NOT NULL auto_increment,
  `CURR_NAME` VARCHAR(45) NOT NULL,
  `CURR_SYMBOL` VARCHAR(45) NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS `TRANSACCIONES` (
  `TRAN_ID` INT PRIMARY KEY NOT NULL auto_increment,
  `SENDER_CUENTA` INT NOT NULL, /* ENVIA DINER DESDE UNA CUENTA */
  `RECEIVER_CUENTA` INT NOT NULL, /* RECIBE DINERO DESDE UNA CUENTA NUEVA.*/
  `TRAN_IMPORTE` INT NOT NULL,
  `TRAN_FECHA` DATE NULL,
  `TRAN_TIPO` VARCHAR(45) NULL
);

INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (1,"APACHAI HOPACHAI","APACHAI@GMAIL.COM","1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (2,"KENICHI SHIRAHAMA","KENICHI@GMAIL.COM","1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (3,"MIU FURINJI","MIU@GMAIL.COM","1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (4, "LARRY PAGE", "LARRY@GOOGLE.COM", "1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (5, "SERGEY BRIN", "SERGEY@GOOGLE.COM", "1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (6, "MARK ZUCKERBERG", "MARK@FACEBOOK.COM", "1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (7, "SATYA NADELA", "SATYA@MICROSOFT.COM", "1234");
INSERT USUARIOS (USU_ID, USU_NAME, USU_EMAIL, USU_PASSWORD) VALUES (8, "TIM COOK", "TIM@APPLE.COM", "1234");

INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (1,100000,2,"DEBITO");
INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (1,100000,2,"CREDITO");
INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (2, 500000, 2, "DEBITO");
INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (2, 200000, 1, "CREDITO");
INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (3, 750000, 3, "DEBITO");
INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (3, 1000000, 2, "CREDITO");
INSERT CUENTAS (USU_ID, CUENTA_SALDO, CURR_ID, CUENTA_TIPO) VALUES (4, 350000, 1, "DEBITO");

SELECT* FROM CUENTAS;

INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (1,'2', '1', '30', '2023-12-05', 'PAGO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (2,'1', '3', '305', '2023-12-21', 'PAGO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (3,'3', '2', '65', '2023-10-21', 'RECIBO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (4,'2', '1', '65', '2023-10-21', 'RECIBO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (5, 3, 1, 100, '2023-11-14', 'PAGO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (6, 1, 2, 200, '2023-11-25', 'PAGO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (7, 2, 3, 50, '2023-12-01', 'RECIBO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (8, 3, 1, 150, '2023-12-08', 'RECIBO');
INSERT TRANSACCIONES (TRAN_ID, SENDER_CUENTA, RECEIVER_CUENTA, TRAN_IMPORTE, TRAN_FECHA, TRAN_TIPO) VALUES (9, 1, 3, 250, '2023-12-15', 'PAGO');
SELECT* FROM TRANSACCIONES;


INSERT MONEDAS (CURR_ID, CURR_NAME, CURR_SYMBOL) VALUES (1,"DOLLAR","US$");
INSERT MONEDAS (CURR_ID, CURR_NAME, CURR_SYMBOL) VALUES (2,"PESOS","CL");
INSERT MONEDAS (CURR_ID, CURR_NAME, CURR_SYMBOL) VALUES (3,"EURO","€");
SELECT* FROM MONEDAS;

-- SELECION DEL NOMBRE DE UNA MONEDA ELEGIDA POR UN USUARIO ESPECIFICO --
SELECT CURR_NAME FROM MONEDAS WHERE CURR_ID IN 
(SELECT CURR_ID FROM CUENTAS WHERE USU_ID = 1);

-- PRUEBA USANDO INNER --
SELECT
M.CURR_NAME
FROM MONEDAS M
INNER JOIN CUENTAS C ON M.CURR_ID = C.CURR_ID WHERE C.CUENTA_ID = '1';

-- MOSTRAR TODAS LAS TRANSACCIONES REALIZADAS --
  SELECT * FROM TRANSACCIONES;

-- OBTENER TODAS LAS TRANSACCIONES REALIZADAS POR UN USUARIO --
SELECT *
FROM TRANSACCIONES
WHERE SENDER_CUENTA = 2 OR RECEIVER_CUENTA = 2;

  -- ACTUALIZACION DE CORREO ELECTRONICO --
  UPDATE USUARIOS
  SET USU_EMAIL = 'USER@GMAIL.COM'
  WHERE USU_ID = '2';
  
  SELECT * FROM USUARIOS;

 -- ELIMINACION DE UNA FILA COMPLETA EN LA TABLA TRANSACCIONES --
DELETE FROM TRANSACCIONES
WHERE TRAN_ID = '2';

SELECT * FROM TRANSACCIONES;



