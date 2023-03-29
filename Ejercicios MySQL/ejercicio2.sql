drop DATABASE if EXISTS ejercicio2;
CREATE DATABASE ejercicio2;
USE ejercicio2;

CREATE TABLE recintos(
	cod_recinto varchar(5) PRIMARY KEY,
    nombre varchar(25) not null,
    direccion varchar(50) not null,
    ciudad varchar(25) not null,
    telefono int(9) not null,
    horario ENUM("HOR1","HOR2","HOR3")

);
CREATE TABLE espectaculos(
	cod_espectaculo varchar(5) PRIMARY KEY,
    nombre varchar(25) not null,
    tipo varchar(10) not null,
    fecha_inicial date not null,
    fecha_final date not null,
    interprete varchar(20) not null,
    cod_recinto varchar(5),
    FOREIGN KEY (cod_recinto) REFERENCES recintos(cod_recinto)     
);

CREATE TABLE espectadores(
	dni_cliente varchar(9) PRIMARY KEY,
    nombre varchar(25) not null,
    direccion varchar(50) not null,
    ciudad varchar(25) not null,
    telefono int(9) not null,
    ntarjeta varchar(10)
);

CREATE TABLE precio_espectaculo(
    cod_espectaculo varchar(5) not null,
    cod_recinto  varchar(5) not null, 
    zona varchar(10) not null,
    precio float not null,
    PRIMARY KEY(cod_espectaculo,cod_recinto,zona),
    FOREIGN KEY (cod_espectaculo) REFERENCES espectaculos(cod_espectaculo),
    FOREIGN KEY (cod_recinto) REFERENCES recintos(cod_recinto)
);

CREATE TABLE zonas_recintos (
    cod_recinto varchar(5) not null,
    zona varchar(10) not null,
    capacidad int,
    PRIMARY KEY(cod_recinto,zona),
    FOREIGN KEY (cod_recinto) REFERENCES recintos(cod_recinto)
);

CREATE TABLE asientos (
    cod_recinto varchar(5) not null,
    zona varchar(10) not null, 
    fila varchar(3) not null, 
    numero int not null,
    PRIMARY KEY(cod_recinto,zona, fila, numero),
    FOREIGN KEY (cod_recinto) REFERENCES recintos(cod_recinto)

);

CREATE TABLE representaciones (
    cod_representacion int AUTO_INCREMENT PRIMARY KEY,
    cod_espectaculo varchar(5), 
    fecha date, 
    hora time ,
    FOREIGN KEY (cod_espectaculo) REFERENCES espectaculos(cod_espectaculo)
);

CREATE TABLE entradas (
    cod_espectaculo varchar(5), 
    fecha date, 
    hora time, 
    cod_recinto varchar(5), 
    fila int , 
    numero int, 
    zona varchar(10), 
    dni_cliente varchar(9),
    PRIMARY KEY(cod_espectaculo, cod_recinto, fila, numero, zona),
    FOREIGN KEY (cod_recinto) REFERENCES recintos(cod_recinto),
    FOREIGN KEY (cod_espectaculo) REFERENCES espectaculos(cod_espectaculo)
);
