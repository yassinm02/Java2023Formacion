
DROP TABLE IF EXISTS lugar, viaje, pasajero;

CREATE TABLE lugar (
    l_codigo int AUTO_INCREMENT PRIMARY KEY,
    l_nombre varchar(25),
    l_tipo varchar(25),
    l_clima varchar(25),
    l_total_habitantes int ,
    l_descripcion varchar(255)
);  

CREATE TABLE pasajero (
    p_codigo int AUTO_INCREMENT PRIMARY KEY ,  
    p_nombre varchar(25),  
    p_apellido varchar(25), 
    p_perfil varchar(25), 
    p_fecha_nacimiento DATE,
    p_num_telefonico varchar(9), 
    p_fk_lugar_pais_residencia int,
    FOREIGN KEY (p_fk_lugar_pais_residencia) REFERENCES lugar(l_codigo)
);

CREATE TABLE viaje (
    v_codigo int AUTO_INCREMENT PRIMARY KEY,  
    v_fk_pasajero int,  
    v_fk_lugar int,
    v_fecha date,
    FOREIGN KEY (v_fk_pasajero) REFERENCES pasajero(p_codigo),
    FOREIGN KEY (v_fk_lugar) REFERENCES lugar(l_codigo)
);







