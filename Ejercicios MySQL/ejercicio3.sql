DROP DATABASE IF EXISTS ejercicio3;
CREATE DATABASE ejercicio3;
USE ejercicio3;

CREATE TABLE empleados(
    dni int(8) PRIMARY KEY,
    nombre varchar(10) NOT NULL,
    apellido1 varchar(15) NOT NULL,
    apellido2 varchar(15),
    direcc1 varchar(25),
    direcc2 varchar(20),
    ciudad varchar(20), 
    provincia varchar(20), 
    cod_postal varchar(5),  
    sexo ENUM("H", "M"),  
    fecha_nac date  
);

CREATE TABLE trabajos( 
    trabajo_cod int(5) PRIMARY KEY,
    nombre_trab  varchar(20) NOT NULL UNIQUE KEY,
    salario_min  int(2) NOT NULL,
    salario_max  int(2) NOT NULL
);

CREATE TABLE departamentos (	
    dpto_cod int(5) PRIMARY KEY,
    nombre_dpto varchar(30) NOT NULL UNIQUE KEY,
    dpto_padre int(5),
    presupuesto int NOT NULL,
    pres_actual  int,
    FOREIGN KEY (dpto_padre) REFERENCES departamentos(dpto_cod)
);

CREATE TABLE estudios(
    empleado_dni int(8),
    universidad int(5),
    año int,
    grado varchar(3),
    especialidad varchar(20),
    FOREIGN KEY (empleado_dni) REFERENCES empleados(dni),
    PRIMARY KEY (empleado_dni, grado)
);

CREATE TABLE universidades(
    univ_cod int(5) PRIMARY KEY,
    nombre_univ varchar(25) not null,
    ciudad  varchar(20),
    municipio  varchar(2) ,
    cod_postal  varchar(5) 
);

CREATE TABLE historial_laboral( 
    empleado_dni int(8),
    trabajo_cod int(5),
    fecha_inicio date,
    fecha_fin date,
    dpto_cod int(5),
    supervisor_dni int(8),
    FOREIGN KEY (empleado_dni) REFERENCES empleados(dni),
    FOREIGN KEY (trabajo_cod) REFERENCES trabajos(trabajo_cod),
    FOREIGN KEY (dpto_cod) REFERENCES departamentos(dpto_cod),
	FOREIGN KEY (supervisor_dni) REFERENCES empleados(dni),
    PRIMARY KEY(empleado_dni, trabajo_cod, fecha_inicio)
);

CREATE TABLE historial_salarial (     
    empleado_dni int(8),
    salario int not null,
    fecha_comienzo date,
    fecha_fin 	date,
    PRIMARY KEY(empleado_dni, fecha_comienzo),
    FOREIGN KEY (empleado_dni) REFERENCES empleados(dni)
);

DROP TRIGGER IF EXISTS comprobarCP; 
DELIMITER %% 
CREATE TRIGGER comprobarCP BEFORE INSERT ON empleados 
FOR EACH ROW 
BEGIN 
	IF NEW.ciudad is NOT null AND NEW.cod_postal is null THEN 
    	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Al haber Ciudad debe insertar Codigo Postal.'; 
    END IF; 
END 
DELIMITER ; 