DROP PROCEDURE IF EXISTS insertarEspectaculo;
DROP PROCEDURE IF EXISTS insertarRecinto;
DROP PROCEDURE IF EXISTS insertarClienteTelefono;
DROP PROCEDURE IF EXISTS insertarEvento;
DROP PROCEDURE IF EXISTS insertarTipo_Usuario;
DROP PROCEDURE IF EXISTS insertarGradaEvento;
DROP PROCEDURE IF EXISTS insertarGrada;
DROP PROCEDURE IF EXISTS insertarLocalidadOfertadaEvento;
DROP PROCEDURE IF EXISTS insertarLocalidad;

DROP PROCEDURE IF EXISTS consultarPorEspectaculo;
DROP PROCEDURE IF EXISTS consultarPorRecinto;
DROP PROCEDURE IF EXISTS consultarLocalidadesOfertadasEvento; 
DROP PROCEDURE IF EXISTS comprar;
DROP PROCEDURE IF EXISTS consultarCompras;
DROP PROCEDURE IF EXISTS anularCompra;

DROP PROCEDURE IF EXISTS cambiarEstadoEvento;

delimiter //
CREATE PROCEDURE IF NOT EXISTS insertarCliente(IN DNI_aux varchar(9),IN Pago_Metodo_aux varchar(50),
   IN Pago_NumeroCuenta_aux varchar (50),CorreoElectronico_aux varchar(50))
BEGIN
    INSERT INTO Cliente VALUES(DNI_aux,Pago_Metodo_aux,Pago_NumeroCuenta_aux,CorreoElectronico_aux);
    SELECT * from Cliente where DNI=DNI_aux and Pago_Metodo=Pago_Metodo_aux and Pago_NumeroCuenta=Pago_NumeroCuenta_aux and CorreoElectronico=CorreoElectronico_aux;
END
//

CREATE PROCEDURE IF NOT EXISTS insertarClienteTelefono(IN DNI_aux varchar(9),IN Telefono_aux int)
BEGIN
    INSERT INTO ClienteTelefono VALUES(DNI_aux,Telefono_aux);
    SELECT * from ClienteTelefono where DNI=DNI_aux and Telefono=Telefono_aux;
END
//


CREATE PROCEDURE IF NOT EXISTS insertarRecinto(IN Lugar_Ciudad_aux varchar(50),IN Lugar_Calle_Nombre_aux varchar (50),IN Lugar_Calle_Numero_aux varchar(50),
   IN Lugar_Sala_aux varchar (50),Nombre_aux varchar(50),Aforo_aux int)
BEGIN
    INSERT INTO Recinto VALUES(Lugar_Ciudad_aux,Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,Lugar_Sala_aux,Nombre_aux,Aforo_aux);
    SELECT * from Recinto where Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and Nombre=Nombre_aux and Aforo=Aforo_aux ;
END
//

CREATE PROCEDURE IF NOT EXISTS insertarEspectaculo(IN Descripcion_Nombre_aux varchar(50),IN Descripcion_Tipo_aux varchar (50),IN PrecioBase_aux FLOAT) 
BEGIN
    INSERT INTO Espectaculo VALUES(Descripcion_Nombre_aux,Descripcion_Tipo_aux,PrecioBase_aux); 
    SELECT * from Espectaculo where Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and PrecioBase=PrecioBase_aux;
END
//

CREATE PROCEDURE IF NOT EXISTS insertarEvento(IN Descripcion_Nombre_aux varchar(50),IN Descripcion_Tipo_aux varchar (50),IN Lugar_Ciudad_aux varchar(50),
IN  Lugar_Calle_Nombre_aux varchar(50),IN Lugar_Calle_Numero_aux VARCHAR(50), IN  Lugar_Sala_aux VARCHAR(50),IN FechaInicio_aux DATETIME, IN FechaFin_aux DATETIME, IN Estado_aux VARCHAR(50)) 
BEGIN
    INSERT INTO Evento VALUES(Descripcion_Nombre_aux,Descripcion_Tipo_aux,Lugar_Ciudad_aux,Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,Lugar_Sala_aux,
    FechaInicio_aux,FechaFin_aux,Estado_aux);
   
    SELECT * from Evento where Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Lugar_Ciudad= Lugar_Ciudad_aux and Lugar_Calle_Nombre= Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala= Lugar_Sala_aux 
    and FechaInicio=FechaInicio_aux and FechaFin=FechaFin_aux and Estado=Estado_aux;
END
//

CREATE PROCEDURE IF NOT EXISTS insertarGrada(IN Nombre_aux VARCHAR(50),IN Capacidad_aux INT,IN Lugar_Ciudad_aux  VARCHAR(50),IN Lugar_Calle_Nombre_aux VARCHAR(50),  
Lugar_Calle_Numero_aux VARCHAR(50), Lugar_Sala_aux VARCHAR(50), Descripcion_Nombre_aux VARCHAR(50),  Descripcion_Tipo_aux VARCHAR(50))
BEGIN
    INSERT INTO Grada VALUES( Nombre_aux, Capacidad_aux , Lugar_Ciudad_aux , Lugar_Calle_Nombre_aux ,  
Lugar_Calle_Numero_aux, Lugar_Sala_aux , Descripcion_Nombre_aux ,  Descripcion_Tipo_aux );
    SELECT * from Grada where Nombre=Nombre_aux and Capacidad=Capacidad_aux and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and 
    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux;
END
//

CREATE PROCEDURE IF NOT EXISTS insertarLocalidad(IN Numero_aux int,IN Estado_localidad_aux varchar(50),IN  Lugar_Ciudad_aux varchar(50),IN Lugar_Calle_Nombre_aux varchar(50),
IN  Lugar_Calle_Numero_aux VARCHAR(50),IN Lugar_Sala_aux VARCHAR(50),IN Descripcion_Nombre_aux  VARCHAR(50),IN Descripcion_Tipo_aux VARCHAR(50),IN Nombre_aux VARCHAR(50),IN num_locs int)

    
    BEGIN
    DECLARE contador int DEFAULT 0;
    DECLARE aforo_aux int DEFAULT 0;

    SELECT count(*) into @contador from Localidad where Numero=Numero_aux and Estado_localidad=Estado_localidad_aux and Lugar_Ciudad=Lugar_Ciudad_aux 
    and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and Descripcion_Nombre=Descripcion_Nombre_aux and 
    Descripcion_Tipo=Descripcion_Tipo_aux and  Nombre=Nombre_aux;

    SELECT Grada.Capacidad into aforo_aux from Grada where 
    Nombre=Nombre_aux and 

    Lugar_Ciudad=Lugar_Ciudad_aux and 
    Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and 
    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and 
    Lugar_Sala=Lugar_Sala_aux and 

    Descripcion_Nombre=Descripcion_Nombre_aux and 
    Descripcion_Tipo=Descripcion_Tipo_aux;

    SET contador=contador+1;

    IF num_locs<= aforo_aux THEN
    SET num_locs=num_locs;
   
    ELSE
    SET  num_locs=aforo_aux;
    END IF;

        WHILE contador<=num_locs DO
        
            INSERT INTO Localidad VALUES( Numero_aux,Estado_localidad_aux,Lugar_Ciudad_aux,Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,Lugar_Sala_aux,
            Descripcion_Nombre_aux,Descripcion_Tipo_aux,Nombre_aux);
    
            SET contador = contador + 1;
            SELECT  contador;
        END WHILE;

        SELECT * from Localidad where Numero=Numero_aux and Estado_localidad=Estado_localidad_aux and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux 
        and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Nombre=Nombre_aux;


END
//

CREATE PROCEDURE IF NOT EXISTS insertarTipo_Usuario(IN Tipo_aux VARCHAR(50),IN Numero_aux INT,IN  Descripcion_Nombre_aux  VARCHAR(50),IN  Descripcion_Tipo_aux VARCHAR(50),IN FactorDescuento_aux FLOAT)
BEGIN
    INSERT INTO Tipo_Usuario VALUES(Tipo_aux, Numero_aux ,
      Descripcion_Nombre_aux ,Descripcion_Tipo_aux, FactorDescuento_aux );

    SELECT * from Tipo_Usuario where Tipo=Tipo_aux AND FactorDescuento=FactorDescuento_aux AND Numero= Numero_aux AND
      Descripcion_Nombre=Descripcion_Nombre_aux AND Descripcion_Tipo=Descripcion_Tipo_aux;


END 
// 
CREATE PROCEDURE IF NOT EXISTS insertarGradaEvento(IN Lugar_Ciudad_aux VARCHAR(50),IN Lugar_Calle_Nombre_aux varchar(50),IN  Lugar_Calle_Numero_aux varchar(50),IN Lugar_Sala_aux varchar(50),IN  Descripcion_Nombre_aux VARCHAR(50),IN Descripcion_Tipo_aux VARCHAR(50),IN  Nombre_aux VARCHAR(50),IN AumentoPrecio_aux float)
BEGIN
    INSERT INTO GradaEvento VALUES( Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux, Lugar_Sala_aux,  Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,AumentoPrecio_aux);
    SELECT * from GradaEvento where Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Nombre=Nombre_aux and AumentoPrecio=AumentoPrecio_aux; 
END
//


CREATE PROCEDURE IF NOT EXISTS insertarLocalidadOfertadaEvento(IN Lugar_Ciudad_aux VARCHAR(50),IN Lugar_Calle_Nombre_aux varchar(50),IN  Lugar_Calle_Numero_aux varchar(50),
IN Lugar_Sala_aux varchar(50),IN  Descripcion_Nombre_aux VARCHAR(50),IN Descripcion_Tipo_aux VARCHAR(50),IN  Nombre_aux VARCHAR(50), IN Numero_aux INT,IN tipo_usuario_aux varchar(50), IN num_locs int)

BEGIN
    DECLARE contador int DEFAULT 0;
    DECLARE aforo_aux int DEFAULT 0;

    SELECT count(*) into @contador from LocalidadOfertadaEvento where Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and 
    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Tipo = tipo_usuario_aux and Lugar_Sala=Lugar_Sala_aux and Descripcion_Nombre=Descripcion_Nombre_aux and 
    Descripcion_Tipo=Descripcion_Tipo_aux and Nombre=Nombre_aux;

    SELECT Grada.Capacidad into aforo_aux from Grada where 
    Nombre=Nombre_aux and 

    Lugar_Ciudad=Lugar_Ciudad_aux and 
    Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and 
    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and 
    Lugar_Sala=Lugar_Sala_aux and 

    Descripcion_Nombre=Descripcion_Nombre_aux and 
    Descripcion_Tipo=Descripcion_Tipo_aux;

    SET contador=contador+1;

    IF num_locs<= aforo_aux THEN
    SET num_locs=num_locs;
   
    ELSE
    SET  num_locs=aforo_aux;
    END IF;
    

    WHILE contador<=num_locs DO
    
        INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
        Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,contador,"Jubilado");

        INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
        Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,contador,"Adulto");

        INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
        Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,contador,"Infantil");

        INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
        Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,contador,"Parado");

        SET contador = contador + 1;
        SELECT  contador;
    END WHILE;

    SELECT Nombre,Numero,Descripcion_Nombre from LocalidadOfertadaEvento where Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux
    and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Nombre=Nombre_aux and Numero=Numero_aux and Tipo=tipo_usuario_aux;

END
//


CREATE PROCEDURE IF NOT EXISTS cambiarEstadoEvento(IN Descripcion_Nombre_aux varchar(50),IN Descripcion_Tipo_aux varchar (50),IN Lugar_Ciudad_aux varchar(50),
    IN Lugar_Calle_Nombre_aux varchar(50),IN Lugar_Calle_Numero_aux varchar(50),IN Lugar_Sala_aux varchar(50),IN FechaInicio_aux DATETIME, IN FechaFin_aux DATETIME, estado_aux varchar(50))
BEGIN
    UPDATE Evento SET estado=estado_aux where Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux
    and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and FechaInicio=FechaInicio_aux and
    FechaFin=FechaFin_aux;
    SELECT * from Evento where Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux
    and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and FechaInicio=FechaInicio_aux and
    FechaFin=FechaFin_aux;


END 
//

CREATE PROCEDURE IF NOT EXISTS consultarPorEspectaculo(IN Descripcion_Nombre_aux varchar(50),IN Descripcion_Tipo_aux varchar (50))
BEGIN
    SELECT Lugar_Ciudad,Lugar_Calle_Nombre,Lugar_Calle_Numero,Lugar_Sala,FechaInicio,FechaFin,estado from Evento where
    Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux ;
END
//  

CREATE PROCEDURE IF NOT EXISTS consultarPorRecinto(IN Lugar_Ciudad_aux varchar(50),IN Lugar_Calle_Nombre_aux varchar (50),IN Lugar_Calle_Numero_aux varchar(50),
    IN Lugar_Sala_aux varchar(50))
BEGIN
    SELECT Descripcion_Nombre,Descripcion_Tipo,FechaInicio,FechaFin,estado from Evento where
    Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux;
END
//


CREATE PROCEDURE IF NOT EXISTS consultarLocalidadesOfertadasEvento(IN Lugar_Ciudad_aux VARCHAR(50),IN Lugar_Calle_Nombre_aux varchar(50),IN  Lugar_Calle_Numero_aux varchar(50),
IN Lugar_Sala_aux varchar(50),IN  Descripcion_Nombre_aux VARCHAR(50),IN Descripcion_Tipo_aux VARCHAR(50),IN  Nombre_aux VARCHAR(50), IN Numero_aux INT,IN tipo_usuario_aux varchar(50))
BEGIN
    SELECT * from LocalidadOfertadaEvento
    where Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and
    Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and  Nombre=Nombre_aux and Numero=Numero_aux and Tipo=tipo_usuario_aux;
END
 
//


CREATE PROCEDURE IF NOT EXISTS consultarCompras(IN DNI_aux varchar(50))
BEGIN
    SELECT *,Cliente.Pago_Metodo from COMPRAR_RESERVA inner join Cliente  on  Cliente.DNI=COMPRAR_RESERVA.DNI where
    COMPRAR_RESERVA.DNI=DNI_aux;
END

//

CREATE PROCEDURE IF NOT EXISTS comprar(IN DNI_aux VARCHAR (9),IN Lugar_Ciudad_aux varchar(50),IN Lugar_Calle_Nombre_aux varchar(50),IN Lugar_Calle_Numero_aux varchar(50),IN Lugar_Sala_aux varchar(50),
IN Descripcion_Nombre_aux varchar(50),IN Descripcion_Tipo_aux varchar (50),IN Tipo_aux VARCHAR(50),IN Numero_aux INT,IN Nombre_aux varchar(50))

BEGIN
    DECLARE estado_evento varchar(50);
    DECLARE salida varchar(500);
    DECLARE salida1 varchar(500);
    DECLARE PrecioFinal_AUX FLOAT;
    DECLARE AumentoPrecio_AUX FLOAT;
    DECLARE PrecioBase_AUX FLOAT;
    DECLARE FactorDescuento_AUX FLOAT;

    SELECT Estado into estado_evento FROM Evento WHERE  
                Descripcion_Nombre=Descripcion_Nombre_aux and  
                Descripcion_Tipo=Descripcion_Tipo_aux and 

                Lugar_Ciudad=Lugar_Ciudad_aux and 
                Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and 
                Lugar_Calle_Numero=Lugar_Calle_Numero_aux and 
                Lugar_Sala=Lugar_Sala_aux;

    IF estado_evento='Empezando' OR estado_evento='Cerrado' OR estado_evento='Finalizado' THEN

    SET @salida1=CONCAT('No puedes comprar entradas de este evento porque no está disponible.');
    SELECT @salida1;

    ELSE

    SELECT AumentoPrecio INTO AumentoPrecio_AUX FROM GradaEvento WHERE Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux and Lugar_Ciudad=Lugar_Ciudad_aux 
    and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux and Nombre=Nombre_aux;

    SELECT PrecioBase INTO PrecioBase_AUX FROM Espectaculo WHERE Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux;

    SELECT FactorDescuento INTO FactorDescuento_AUX FROM Tipo_Usuario WHERE Tipo=Tipo_aux and Numero=Numero_aux and  Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux;

    SET PrecioFinal_AUX = AumentoPrecio_AUX*FactorDescuento_AUX*PrecioBase_AUX;

    UPDATE Localidad SET Estado_localidad='reservado' where Numero=Numero_aux and Nombre=Nombre_aux and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux 
    and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux;

    insert into COMPRAR_RESERVA values(DNI_aux,Lugar_Ciudad_aux,Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,Lugar_Sala_aux,
    Descripcion_Nombre_aux,Descripcion_Tipo_aux,Tipo_aux,Numero_aux,Nombre_aux,PrecioFinal_AUX);
    SET @salida=CONCAT('Se ha realizado la compra, con el precio: ',PrecioFinal_AUX, '.');
    SELECT @salida;
    CALL consultarCompras(DNI_aux);
    CALL consultarLocalidadesOfertadasEvento(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
        Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,Tipo_aux);
    
    END IF;
END

//

CREATE PROCEDURE IF NOT EXISTS anularCompra( IN DNI_aux VARCHAR (9),IN Lugar_Ciudad_aux varchar(50),IN Lugar_Calle_Nombre_aux varchar(50),IN Lugar_Calle_Numero_aux varchar(50),IN Lugar_Sala_aux varchar(50),
IN Descripcion_Nombre_aux varchar(50),IN Descripcion_Tipo_aux varchar (50),IN Tipo_aux VARCHAR(50),IN Numero_aux INT,IN Nombre_aux varchar(50))

BEGIN

    DECLARE contador int;
    DECLARE contador2 int;
    DECLARE tipo_usuario_aux varchar(50);
    DECLARE estado_evento varchar(50);
    DECLARE precio_aux FLOAT;
    DECLARE penalizacion_aux FLOAT;
    DECLARE salida varchar(500);



    SELECT count(*) into @contador FROM COMPRAR_RESERVA WHERE 
    Lugar_Ciudad=Lugar_Ciudad_aux and
    Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and
    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and
    Lugar_Sala=Lugar_Sala_aux and

    Descripcion_Nombre=Descripcion_Nombre_aux and 
    Descripcion_Tipo=Descripcion_Tipo_aux and
    
    Tipo=Tipo_aux and
    Numero=Numero_aux and
    Nombre=Nombre_aux;

        IF @contador=1 THEN
            SELECT count(*) into @contador2 FROM COMPRAR_RESERVA WHERE nombre=nombre_aux and  
            DNI=DNI_aux and

            Lugar_Ciudad=Lugar_Ciudad_aux and
            Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and
            Lugar_Calle_Numero=Lugar_Calle_Numero_aux and
            Lugar_Sala=Lugar_Sala_aux and

            Descripcion_Nombre=Descripcion_Nombre_aux and 
            Descripcion_Tipo=Descripcion_Tipo_aux and
            
            Tipo=Tipo_aux and
            Numero=Numero_aux and
            Nombre=Nombre_aux;

            IF @contador2=0 THEN
                signal sqlstate '45000' set MESSAGE_TEXT='Esta localidad no esta reservada con este DNI';

            ELSE 

                SELECT PrecioFinal into precio_aux FROM COMPRAR_RESERVA WHERE 
                DNI=DNI_aux and

                Lugar_Ciudad=Lugar_Ciudad_aux and
                Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and
                Lugar_Calle_Numero=Lugar_Calle_Numero_aux and
                Lugar_Sala=Lugar_Sala_aux and

                Descripcion_Nombre=Descripcion_Nombre_aux and 
                Descripcion_Tipo=Descripcion_Tipo_aux and
                
                Tipo=Tipo_aux and
                Numero=Numero_aux and
                Nombre=Nombre_aux;

                SELECT Estado into estado_evento FROM Evento WHERE  
                Descripcion_Nombre=Descripcion_Nombre_aux and  
                Descripcion_Tipo=Descripcion_Tipo_aux and 

                Lugar_Ciudad=Lugar_Ciudad_aux and 
                Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and 
                Lugar_Calle_Numero=Lugar_Calle_Numero_aux and 
                Lugar_Sala=Lugar_Sala_aux;

                

                IF estado_evento='Empezando' THEN  
                    SET precio_aux=precio_aux+precio_aux*25/100;
                    SET penalizacion_aux=precio_aux*25/100;
                    SET @salida=CONCAT('Se ha aplicado una penalización por cancelar demasiado tarde de: ' ,penalizacion_aux,'. Se cargaran ',precio_aux,' euros en la tarjeta');
                    SELECT @salida;

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Jubilado");

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Adulto");

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Infantil");

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Parado");


                    UPDATE Localidad SET Estado_localidad='libre' where Numero=Numero_aux and Nombre=Nombre_aux and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux 
                    and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux;

                    DELETE FROM COMPRAR_RESERVA WHERE 
                    DNI=DNI_aux and

                    Lugar_Ciudad=Lugar_Ciudad_aux and
                    Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and
                    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and
                    Lugar_Sala=Lugar_Sala_aux and

                    Descripcion_Nombre=Descripcion_Nombre_aux and 
                    Descripcion_Tipo=Descripcion_Tipo_aux and
                    
                    Tipo=Tipo_aux and
                    Numero=Numero_aux and
                    Nombre=Nombre_aux;

                    CALL consultarCompras(DNI_aux);
                    CALL consultarLocalidadesOfertadasEvento(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,Tipo_aux);
                

                ELSE 
                    IF estado_evento = "Cerrado" OR estado_evento = "Finalizado" THEN
                    SET @salida=CONCAT('Ya no puedes anular tu reserva, el espectáculo está cerrado o finalizado.');
                    SELECT @salida;
                    ELSE 

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Jubilado");

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Adulto");

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Infantil");

                    INSERT INTO LocalidadOfertadaEvento values(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,"Parado");


                    UPDATE Localidad SET Estado_localidad='libre' where Numero=Numero_aux and Nombre=Nombre_aux and Descripcion_Nombre=Descripcion_Nombre_aux and Descripcion_Tipo=Descripcion_Tipo_aux 
                    and Lugar_Ciudad=Lugar_Ciudad_aux and Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and Lugar_Calle_Numero=Lugar_Calle_Numero_aux and Lugar_Sala=Lugar_Sala_aux;

                    DELETE FROM COMPRAR_RESERVA WHERE 
                    DNI=DNI_aux and

                    Lugar_Ciudad=Lugar_Ciudad_aux and
                    Lugar_Calle_Nombre=Lugar_Calle_Nombre_aux and
                    Lugar_Calle_Numero=Lugar_Calle_Numero_aux and
                    Lugar_Sala=Lugar_Sala_aux and

                    Descripcion_Nombre=Descripcion_Nombre_aux and 
                    Descripcion_Tipo=Descripcion_Tipo_aux and
                    
                    Tipo=Tipo_aux and
                    Numero=Numero_aux and
                    Nombre=Nombre_aux;

                    SET @salida=CONCAT('Anulada correctamente, sin cargos extra.');
                    SELECT @salida;
                    CALL consultarCompras(DNI_aux);
                    CALL consultarLocalidadesOfertadasEvento(Lugar_Ciudad_aux, Lugar_Calle_Nombre_aux,Lugar_Calle_Numero_aux,
                    Lugar_Sala_aux,Descripcion_Nombre_aux, Descripcion_Tipo_aux, Nombre_aux,Numero_aux,Tipo_aux);

                    END IF;
                END IF;            
            END IF;
        ELSE
            signal sqlstate '45000' set MESSAGE_TEXT='Esta localidad no esta reservada.';
        END IF;
END
//
delimiter ;

