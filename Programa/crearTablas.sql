SYSTEM clear;

DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS ClienteTelefono;
DROP TABLE IF EXISTS Recinto;
DROP TABLE IF EXISTS Espectaculo;
DROP TABLE IF EXISTS Grada;
DROP TABLE IF EXISTS Localidad;
DROP TABLE IF EXISTS Tipo_Usuario;
DROP TABLE IF EXISTS GradaEvento;
DROP TABLE IF EXISTS LocalidadOfertadaEvento;
DROP TABLE IF EXISTS COMPRAR_RESERVA;
DROP TABLE IF EXISTS ANULA;

CREATE TABLE if not exists Cliente(

    DNI VARCHAR(9) NOT NULL,
    Pago_Metodo VARCHAR(50)  DEFAULT "Tarjeta" NOT NULL CHECK (Pago_Metodo = "Efectivo" OR Pago_Metodo = "Tarjeta" OR Pago_Metodo = "PayPal" OR Pago_Metodo ="Bizum" OR Pago_Metodo = "Transferencia"),
    Pago_NumeroCuenta VARCHAR(50),
    CorreoElectronico VARCHAR(50),
    CONSTRAINT PK_Cliente PRIMARY KEY (DNI)

);

CREATE TABLE if not exists ClienteTelefono(

    DNI VARCHAR(9) NOT NULL,
    Telefono INT NOT NULL,  
    FOREIGN KEY (DNI) REFERENCES Cliente (DNI),
    CONSTRAINT pk_ClienteTelefono PRIMARY KEY (Telefono,DNI)


);

CREATE TABLE if not exists Recinto(

    Lugar_Ciudad VARCHAR(50) NOT NULL,
    Lugar_Calle_Nombre VARCHAR(50) NOT NULL,
    Lugar_Calle_Numero VARCHAR(50) NOT NULL,
    Lugar_Sala VARCHAR(50) NOT NULL,
   
    Nombre VARCHAR(50) NOT NULL,
    
    Aforo INT NOT NULL CHECK (Aforo > 0),
    CONSTRAINT PK_RECINTO PRIMARY KEY  (Lugar_Ciudad, Lugar_Calle_Nombre, Lugar_Calle_Numero, Lugar_Sala)
   
);

CREATE TABLE if not exists Espectaculo(

    Descripcion_Nombre  VARCHAR(50) NOT NULL ,
    Descripcion_Tipo VARCHAR(50) NOT NULL ,
    
    PrecioBase FLOAT NOT NULL CHECK (PrecioBase >= 0),
   
    CONSTRAINT PK_Espectaculo PRIMARY KEY  (Descripcion_Nombre, Descripcion_Tipo)
);

CREATE TABLE if not exists Evento(

    Descripcion_Nombre  VARCHAR(50) NOT NULL ,
    Descripcion_Tipo VARCHAR(50) NOT NULL ,

    Lugar_Ciudad VARCHAR(50) NOT NULL,
    Lugar_Calle_Nombre VARCHAR(50) NOT NULL,
    Lugar_Calle_Numero VARCHAR(50) NOT NULL,
    Lugar_Sala VARCHAR(50) NOT NULL,
    
    FechaInicio DATETIME NOT NULL,
    FechaFin  DATETIME NOT NULL,
    
    Estado VARCHAR(50) DEFAULT "Abierto" NOT NULL CHECK (Estado = "Abierto" OR Estado = "Cerrado" OR Estado = "Finalizado" OR Estado = "Empezando"),
   
    FOREIGN KEY (Lugar_Ciudad, Lugar_Calle_Nombre, Lugar_Calle_Numero, Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad, Lugar_Calle_Nombre, Lugar_Calle_Numero, Lugar_Sala),
    CONSTRAINT PK_Espectaculo PRIMARY KEY  (Descripcion_Nombre, Descripcion_Tipo,Lugar_Ciudad, Lugar_Calle_Nombre, Lugar_Calle_Numero, Lugar_Sala)
);

CREATE TABLE if not exists Grada(

    Nombre VARCHAR(50)  NOT NULL,
    Capacidad INT NOT NULL CHECK (Capacidad > 0),

    Lugar_Ciudad VARCHAR(50),
    Lugar_Calle_Nombre VARCHAR(50),
    Lugar_Calle_Numero VARCHAR(50),
    Lugar_Sala   VARCHAR(50),
    
    Descripcion_Nombre VARCHAR(50),
    Descripcion_Tipo VARCHAR(50),
    
    FOREIGN KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    CONSTRAINT PK_Grada PRIMARY KEY (Nombre,Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,Descripcion_Nombre,Descripcion_Tipo)
);


CREATE TABLE if not exists Localidad(

    Numero INT NOT NULL AUTO_INCREMENT,
    Estado_localidad VARCHAR(50) DEFAULT "Libre" NOT NULL CHECK (Estado_localidad = "Libre" OR Estado_localidad = "Reservado" OR Estado_localidad = "Deteriorado" OR Estado_localidad = "Pre-Reservado"),
    
    Lugar_Ciudad VARCHAR(50) NOT NULL,
    Lugar_Calle_Nombre VARCHAR(50) NOT NULL,
    Lugar_Calle_Numero VARCHAR(50) NOT NULL,
    Lugar_Sala VARCHAR(50) NOT NULL,

    Descripcion_Nombre  VARCHAR(50) NOT NULL,
    Descripcion_Tipo VARCHAR(50) NOT NULL,

    Nombre VARCHAR(50),
    
    FOREIGN KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    FOREIGN KEY (Nombre) REFERENCES Grada(Nombre),
    CONSTRAINT PK_Localidad PRIMARY KEY (Numero,Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,Descripcion_Nombre,Descripcion_Tipo,Nombre)
);

CREATE TABLE if not exists Tipo_Usuario(

    Tipo VARCHAR(50) CHECK (Tipo = "Jubilado" OR Tipo = "Adulto" OR Tipo = "Infantil" OR Tipo = "Parado"),
    
    Numero INT,
    
    Descripcion_Nombre  VARCHAR(50),
    Descripcion_Tipo VARCHAR(50),
    
    FactorDescuento FLOAT DEFAULT 1 NOT NULL CHECK (FactorDescuento <= 1 AND FactorDescuento >= 0),

    FOREIGN KEY (Numero) REFERENCES Localidad(Numero),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    CONSTRAINT PK_Tipo_Usuario PRIMARY KEY (Tipo,Numero,Descripcion_Nombre,Descripcion_Tipo)
);

CREATE TABLE if not exists GradaEvento(

    Lugar_Ciudad VARCHAR(50),
    Lugar_Calle_Nombre VARCHAR(50) NOT NULL,
    Lugar_Calle_Numero VARCHAR(50) NOT NULL,
    Lugar_Sala VARCHAR(50),
   
    Descripcion_Nombre  VARCHAR(50),
    Descripcion_Tipo VARCHAR(50),

    Nombre VARCHAR(50),

    AumentoPrecio FLOAT DEFAULT 1 NOT NULL CHECK (AumentoPrecio >= 1),

    FOREIGN KEY (Nombre) REFERENCES Grada(Nombre),
    FOREIGN KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    CONSTRAINT PK_GradaEvento PRIMARY KEY (Nombre,Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,Descripcion_Nombre,Descripcion_Tipo)

);

CREATE TABLE if not exists LocalidadOfertadaEvento(
    Lugar_Ciudad VARCHAR(50),
    Lugar_Calle_Nombre VARCHAR(50)  NOT NULL,
    Lugar_Calle_Numero VARCHAR(50)  NOT NULL,
    Lugar_Sala VARCHAR(50),

    Descripcion_Nombre  VARCHAR(50),
    Descripcion_Tipo VARCHAR(50),

    Nombre VARCHAR(50),

    Numero INT,

    Tipo varchar(50),

    FOREIGN KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    FOREIGN KEY (Nombre) REFERENCES Grada(Nombre),
    FOREIGN KEY (Numero) REFERENCES Localidad(Numero),
    FOREIGN KEY (Tipo) REFERENCES Tipo_Usuario(Tipo),
    CONSTRAINT PK_LocalidadOfertadaEvento PRIMARY KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,Descripcion_Nombre,Descripcion_Tipo,Nombre,Numero,Tipo)

    
);

CREATE TABLE if not exists COMPRAR_RESERVA(

    
    DNI VARCHAR(9),

    Lugar_Ciudad VARCHAR(50) NOT NULL,
    Lugar_Calle_Nombre VARCHAR(50) NOT NULL,
    Lugar_Calle_Numero VARCHAR(50) NOT NULL,
    Lugar_Sala VARCHAR(50) NOT NULL,

    Descripcion_Nombre VARCHAR(50) NOT NULL,
    Descripcion_Tipo VARCHAR(50) NOT NULL,

    Tipo VARCHAR(50) NOT NULL,

    Numero INT NOT NULL,

    Nombre varchar(50) NOT NULL,
   
    PrecioFinal FLOAT,

    FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
    FOREIGN KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    FOREIGN KEY (Tipo) REFERENCES Tipo_Usuario(Tipo),
    FOREIGN KEY (Numero) REFERENCES Localidad(Numero),
    FOREIGN KEY (Nombre) REFERENCES Grada(Nombre),
    CONSTRAINT PK_COMPRAR_RESERVA PRIMARY KEY (DNI,Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,Descripcion_Nombre,Descripcion_Tipo,Tipo,Numero,Nombre)


);

CREATE TABLE if not exists ANULA(

    DNI VARCHAR(9),

    Lugar_Ciudad VARCHAR(50),
    Lugar_Calle_Nombre VARCHAR(50)  NOT NULL,
    Lugar_Calle_Numero VARCHAR(50)  NOT NULL,
    Lugar_Sala VARCHAR(50),

    Descripcion_Nombre VARCHAR(50),
    Descripcion_Tipo VARCHAR(50),

    Tipo VARCHAR(50),

    Numero INT,

    Nombre VARCHAR(50),
    
    FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
    FOREIGN KEY (Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala) REFERENCES Recinto(Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala),
    FOREIGN KEY (Descripcion_Nombre,Descripcion_Tipo) REFERENCES Espectaculo(Descripcion_Nombre,Descripcion_Tipo),
    FOREIGN KEY (Tipo) REFERENCES Tipo_Usuario(Tipo),
    FOREIGN KEY (Numero) REFERENCES Localidad(Numero),
    FOREIGN KEY (Nombre) REFERENCES Grada(Nombre),
    CONSTRAINT PK_ANULA PRIMARY KEY (DNI,Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,Descripcion_Nombre,Descripcion_Tipo,Tipo,Numero,Nombre)

);

SHOW TABLES;
