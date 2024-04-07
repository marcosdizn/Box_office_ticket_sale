delimiter //
DROP TRIGGER IF EXISTS triggerInsertCompra;


CREATE TRIGGER IF NOT EXISTS triggerInsertCompra BEFORE INSERT on COMPRAR_RESERVA FOR EACH ROW
BEGIN   

        DECLARE estado_evento varchar(50);
        DECLARE contador int;
        DECLARE contador2 int;
        DECLARE numero int DEFAULT 0;
                                            
        SELECT count(*) into @contador FROM COMPRAR_RESERVA WHERE 
        COMPRAR_RESERVA.Lugar_Ciudad=new.Lugar_Ciudad and
        COMPRAR_RESERVA.Lugar_Calle_Nombre=new.Lugar_Calle_Nombre and
        COMPRAR_RESERVA.Lugar_Calle_Numero=new.Lugar_Calle_Numero and
        COMPRAR_RESERVA.Lugar_Sala=new.Lugar_Sala and

        COMPRAR_RESERVA.Descripcion_Nombre=new.Descripcion_Nombre and 
        COMPRAR_RESERVA.Descripcion_Tipo=new.Descripcion_Tipo and
       
        COMPRAR_RESERVA.Numero=new.Numero and
        COMPRAR_RESERVA.Nombre=new.Nombre;
                                                    
        SELECT count(*) into numero FROM LocalidadOfertadaEvento WHERE 
        LocalidadOfertadaEvento.Lugar_Ciudad=new.Lugar_Ciudad and 
        LocalidadOfertadaEvento.Lugar_Calle_Nombre=new.Lugar_Calle_Nombre and 
        LocalidadOfertadaEvento.Lugar_Calle_Numero=new.Lugar_Calle_Numero and 
        LocalidadOfertadaEvento.Lugar_Sala=new.Lugar_Sala and 

        LocalidadOfertadaEvento.Descripcion_Nombre=new.Descripcion_Nombre and 
        LocalidadOfertadaEvento.Descripcion_Tipo=new.Descripcion_Tipo and 

        LocalidadOfertadaEvento.Nombre=new.Nombre and 
        LocalidadOfertadaEvento.Numero=new.Numero;

        IF numero>0 or @contador=1 THEN 

            IF @contador=1 THEN 
                SELECT count(*) into @contador2 FROM COMPRAR_RESERVA WHERE 
                COMPRAR_RESERVA.Lugar_Ciudad=new.Lugar_Ciudad and
                COMPRAR_RESERVA.Lugar_Calle_Nombre=new.Lugar_Calle_Nombre and
                COMPRAR_RESERVA.Lugar_Calle_Numero=new.Lugar_Calle_Numero and
                COMPRAR_RESERVA.Lugar_Sala=new.Lugar_Sala and

                COMPRAR_RESERVA.Descripcion_Nombre=new.Descripcion_Nombre and 
                COMPRAR_RESERVA.Descripcion_Tipo=new.Descripcion_Tipo and
        
                COMPRAR_RESERVA.Numero=new.Numero and
                COMPRAR_RESERVA.Nombre=new.Nombre and
                COMPRAR_RESERVA.DNI=new.DNI; 

                IF @contador2=0 THEN
                    signal sqlstate '45000' set MESSAGE_TEXT='Esta localidad no esta reservada con este DNI';
                ELSE 
                    
                    signal sqlstate '45000' set MESSAGE_TEXT='Esa localidad estaba ya esta reservada.';
                    
                END IF;
            ELSE

            SELECT Estado into estado_evento FROM Evento WHERE  
                Descripcion_Nombre=new.Descripcion_Nombre and  
                Descripcion_Tipo=new.Descripcion_Tipo and 

                Lugar_Ciudad=new.Lugar_Ciudad and 
                Lugar_Calle_Nombre=new.Lugar_Calle_Nombre and 
                Lugar_Calle_Numero=new.Lugar_Calle_Numero and 
                Lugar_Sala=new.Lugar_Sala;

                IF estado_evento='Empezando' OR estado_evento='Cerrado' OR estado_evento='Finalizado' THEN
    
               SELECT 'HOLA' into estado_evento;
   
                ELSE
                DELETE FROM LocalidadOfertadaEvento  WHERE 
                LocalidadOfertadaEvento.Lugar_Ciudad=new.Lugar_Ciudad and 
                LocalidadOfertadaEvento.Lugar_Calle_Nombre=new.Lugar_Calle_Nombre and 
                LocalidadOfertadaEvento.Lugar_Calle_Numero=new.Lugar_Calle_Numero and 
                LocalidadOfertadaEvento.Lugar_Sala=new.Lugar_Sala and 
                LocalidadOfertadaEvento.Descripcion_Nombre=new.Descripcion_Nombre and 
                LocalidadOfertadaEvento.Descripcion_Tipo=new.Descripcion_Tipo and 

                LocalidadOfertadaEvento.Nombre=new.Nombre and 
                LocalidadOfertadaEvento.Numero=new.Numero;  
            
                END IF;
               
                    
            END IF;
        ELSE
            signal sqlstate '23000' set MESSAGE_TEXT='No se puede comprar esta entrada';
        END IF;
END
//

delimiter ;

