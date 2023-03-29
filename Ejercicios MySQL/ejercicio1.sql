drop database if exists ejercicio1;
create database ejercicio1;
use ejercicio1;

CREATE TABLE pub(
    cod_pub varchar(20) primary key,
    nombre varchar(50) NOT NULL,
    licencia_fiscal varchar(50) NOT NULL,
    domicilio varchar(50),
    fecha_apertura date NOT NULL,
    horario ENUM("HOR1","HOR2","HOR3") NOT NULL,
    cod_localidad varchar(20) not null,
    FOREIGN KEY (cod_localidad) REFERENCES localidad(cod_localidad)
);

CREATE TABLE titular(
    dni_titular varchar(10) PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    domicilio varchar(50),
    cod_pub varchar (20) NOT NULL,
    foreign key (cod_pub) REFERENCES pub(cod_pub)
);

CREATE TABLE empleado (
    dni_empleado varchar(10) PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    domicilio varchar(50)
);

CREATE TABLE existencias(
	cod_articulo varchar(20) PRIMARY KEY,
    nombre varchar(25) NOT NULL,
	cantidad int NOT NULL,
    precio int NOT NULL CHECK (precio > 0),
    cod_pub varchar(20),
    foreign key (cod_pub) REFERENCES pub(cod_pub)
);

CREATE TABLE localidad (
	cod_localidad varchar(20) PRIMARY KEY,
    nombre varchar(25) NOT NULL
);

CREATE TABLE pub_empleado(
    cod_pub varchar(20),
    dni_empleado varchar(10),
    funcion ENUM("CAMARERO", "SEGURIDAD", "LIMPIEZA"),
    primary key (cod_pub, dni_empleado, funcion)
    foreign key (cod_pub) REFERENCES pub(cod_pub),
    foreign key (dni_empleado) REFERENCES empleado(dni_empleado)
);
