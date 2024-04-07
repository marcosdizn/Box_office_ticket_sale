--PROBAMOS ESTAS

CALL insertarCliente('29575298N','Tarjeta','ES6802375017717589039068','kji@gmail.com');
CALL insertarCliente('10989204B','Efectivo','','luis_gd7@hotmail.com');
CALL insertarCliente('85568530C','PayPal','ES9601259778858404438644','maria_dgz3@yahoo.com');
CALL insertarCliente('77711775L','Bizum','ES9601259778858404438644','mfdz@hotmail.com');
CALL insertarCliente('25537467S','Transferencia','ES9000118864217981224777','agarcia@gmail.com');

CALL insertarClienteTelefono('29575298N',695312267);
CALL insertarClienteTelefono('10989204B',697000380);
CALL insertarClienteTelefono('85568530C',647312261);
CALL insertarClienteTelefono('77711775L',691333550);
CALL insertarClienteTelefono('25537467S',642043172);
CALL insertarClienteTelefono('25537467S',644494943);

CALL insertarRecinto('Vigo','Av. de Balaidos','s/n','Estadio','Estadio de Balaidos',29000);
CALL insertarRecinto('Madrid','Av. de Concha Espina','1','Estadio','Estadio Santiago Bernabeu',81000);
CALL insertarRecinto('Barcelona','C. Aristides Maillol','12','Estadio','Camp Nou',99000);
CALL insertarRecinto('Madrid','Av. de Luis Aragones','4','Estadio','Estadio Metropolitano',68000);
CALL insertarRecinto('Sevilla','Av. de Heliopolis','s/n','Estadio','Estadio Benito Villamarin',60000);

CALL insertarEspectaculo('Celta-Valencia','Futbol',30);
CALL insertarEspectaculo('Coldplay','Concierto',70);
CALL insertarEspectaculo('Real Madrid-Manchester City','Futbol',80);
CALL insertarEspectaculo('Harry Styles','Concierto',85);
CALL insertarEspectaculo('Betis-Getafe','Futbol',45);

CALL insertarEvento('Celta-Valencia','Futbol','Vigo','Av. de Balaidos','s/n','Estadio','2023-05-20 14:00:00','2023-05-20 16:00:00','Abierto');
CALL insertarEvento('Coldplay','Concierto','Madrid','Av. de Luis Aragones','4','Estadio','2023-07-19 21:00:00','2023-05-19 23:00:00','Abierto');
CALL insertarEvento('Real Madrid-Manchester City','Futbol','Madrid','Av. de Concha Espina','1','Estadio','2023-05-09 21:00:00','2023-05-09 23:00:00','Finalizado');
CALL insertarEvento('Harry Styles','Concierto','Barcelona','C. Aristides Maillol','12','Estadio','2023-08-27 22:00:00','2023-08-27 23:45:00','Abierto');
CALL insertarEvento('Betis-Getafe','Futbol','Sevilla','Av. de Heliopolis','s/n','Estadio','2023-05-26 18:00:00','2023-05-26 20:00:00','Abierto');

CALL insertarGrada('Rio',7000,'Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol');
CALL insertarGrada('Tribuna',4000,'Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol');
CALL insertarGrada('Fondo Sur',10000,'Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol');
CALL insertarGrada('Gol',8000,'Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol');
CALL insertarGrada('Pista',25000,'Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto');
CALL insertarGrada('VIP',5000,'Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto');
CALL insertarGrada('Grada Baja',26000,'Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto');
CALL insertarGrada('Grada Alta',25000,'Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto');
CALL insertarGrada('Rio',20000,'Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol');
CALL insertarGrada('Tribuna',20000,'Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol');
CALL insertarGrada('Fondo Sur',20000,'Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol');
CALL insertarGrada('Gol',20000,'Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol');
CALL insertarGrada('Pista',18000,'Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto');
CALL insertarGrada('VIP',10000,'Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto');
CALL insertarGrada('Grada Baja',18000,'Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto');
CALL insertarGrada('Grada Alta',18000,'Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto');
CALL insertarGrada('Rio',10000,'Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol');
CALL insertarGrada('Tribuna',8000,'Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol');
CALL insertarGrada('Fondo Sur',20000,'Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol');
CALL insertarGrada('Gol',20000,'Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol');

CALL insertarLocalidad(NULL,'Libre','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio');
CALL insertarLocalidad(NULL,'Libre','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio');
CALL insertarLocalidad(NULL,'Libre','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio');
CALL insertarLocalidad(NULL,'Libre','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio');
CALL insertarLocalidad(NULL,'Reservado','Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Tribuna');
CALL insertarLocalidad(NULL,'Reservado','Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Tribuna');
CALL insertarLocalidad(NULL,'Reservado','Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Tribuna');
CALL insertarLocalidad(NULL,'Deteriorado','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna');
CALL insertarLocalidad(NULL,'Deteriorado','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna');
CALL insertarLocalidad(NULL,'Deteriorado','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna');
CALL insertarLocalidad(NULL,'Pre-Reservado','Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Fondo Sur');
CALL insertarLocalidad(NULL,'Pre-Reservado','Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Fondo Sur');
CALL insertarLocalidad(NULL,'Libre','Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol');
CALL insertarLocalidad(NULL,'Libre','Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol');
CALL insertarLocalidad(NULL,'Libre','Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol');
CALL insertarLocalidad(NULL,'Libre','Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol');

CALL insertarTipo_Usuario('Jubilado',1,'Celta-Valencia','Futbol',0.40);
CALL insertarTipo_Usuario('Adulto',2,'Celta-Valencia','Futbol',1);
CALL insertarTipo_Usuario('Parado',3,'Celta-Valencia','Futbol',0.70);
CALL insertarTipo_Usuario('Infantil',4,'Celta-Valencia','Futbol',0.80);
CALL insertarTipo_Usuario('Adulto',1,'Harry Styles','Concierto',1);
CALL insertarTipo_Usuario('Parado',2,'Harry Styles','Concierto',0.5);
CALL insertarTipo_Usuario('Infantil',3,'Harry Styles','Concierto',0.4);
CALL insertarTipo_Usuario('Jubilado',4,'Harry Styles','Concierto',0.5);
CALL insertarTipo_Usuario('Parado',1,'Real Madrid-Manchester City','Futbol',0.6);
CALL insertarTipo_Usuario('Adulto',2,'Real Madrid-Manchester City','Futbol',1);
CALL insertarTipo_Usuario('Jubilado',3,'Real Madrid-Manchester City','Futbol',0.6);
CALL insertarTipo_Usuario('Infantil',4,'Real Madrid-Manchester City','Futbol',0.5);
CALL insertarTipo_Usuario('Parado',1,'Coldplay','Concierto',0.70);
CALL insertarTipo_Usuario('Adulto',2,'Coldplay','Concierto',1);
CALL insertarTipo_Usuario('Jubilado',3,'Coldplay','Concierto',0.6);
CALL insertarTipo_Usuario('Infantil',4,'Coldplay','Concierto',0.5);
CALL insertarTipo_Usuario('Jubilado',1,'Betis-Getafe','Futbol',0.60);
CALL insertarTipo_Usuario('Infantil',2,'Betis-Getafe','Futbol',0.30);
CALL insertarTipo_Usuario('Adulto',3,'Betis-Getafe','Futbol',1);
CALL insertarTipo_Usuario('Parado',4,'Betis-Getafe','Futbol',0.6);


CALL insertarGradaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio',1.5);
CALL insertarGradaEvento('Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna',2);
CALL insertarGradaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Tribuna',1);
CALL insertarGradaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Fondo Sur',1.80);
CALL insertarGradaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol',1.70);


CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio6',4500,'Adulto',102);

CALL cambiarEstadoEvento('Celta-Valencia','Futbol','Vigo','Av. de Balaidos','s/n','Estadio','2023-05-20 14:00:00','2023-05-20 16:00:00','Finalizado');

CALL consultarPorEspectaculo('Celta-Valencia','Futbol');
CALL consultarPorEspectaculo('Harry Styles','Concierto');

CALL consultarPorRecinto('Madrid','Av. de Concha Espina','1','Estadio');
CALL consultarPorRecinto('Barcelona','C. Aristides Maillol','12','Estadio');

CALL consultarLocalidadesOfertadasEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','VIP',1,'Jubilado');


CALL consultarCompras('29575298N');
CALL comprar('29575298N','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Adulto',1,'Rio6');
CALL consultarCompras('29575298N');


CALL comprar('29575298N','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Infantil',2,'Rio');
CALL comprar('29575298N','Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Parado',1,'Pista');

CALL consultarCompras('29575298N');

CALL anularCompra('29575298N','Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Adulto',1,'Rio6');

CALL consultarCompras('29575298N');



---PROBAMOS HASTA AQUI, aunque en principio va bien el resto-----


CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Tribuna',2250,'Adulto',4000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Fondo Sur',5000,'Adulto',10000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Gol',4000,'Adulto',8000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio',1000,'Jubilado',7000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Tribuna',750,'Jubilado',4000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Fondo Sur',2000,'Jubilado',10000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Gol',1500,'Jubilado',8000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio',1000,'Parado',7000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Tribuna',750,'Parado',4000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Fondo Sur',2000,'Parado',10000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Gol',1500,'Parado',8000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Rio',500,'Infantil',7000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Tribuna',250,'Infantil',4000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Fondo Sur',1000,'Infantil',10000);
CALL insertarLocalidadOfertadaEvento('Vigo','Av. de Balaidos','s/n','Estadio','Celta-Valencia','Futbol','Gol',1000,'Infantil',8000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Rio',10000,'Adulto',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna',10000,'Adulto',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Fondo Sur',10000,'Adulto',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Gol',10000,'Adulto',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Rio',4000,'Jubilado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna',4000,'Jubilado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Fondo Sur',4000,'Jubilado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Gol',4000,'Jubilado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Rio',4000,'Parado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna',4000,'Parado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Fondo Sur',4000,'Parado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Gol',4000,'Parado',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Rio',2000,'Infantil',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Tribuna',2000,'Infantil',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Fondo Sur',2000,'Infantil',20000);
CALL insertarLocalidadOfertadaEvento('Madrid','Madrid','Av. de Concha Espina','1','Estadio','Real Madrid-Manchester City','Futbol','Gol',2000,'Infantil',20000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Pista',13000,'Adulto',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','VIP',2000,'Adulto',5000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Baja',13000,'Adulto',26000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Alta',13000,'Adulto',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Pista',5000,'Jubilado',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','VIP',1000,'Jubilado',5000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Baja',5000,'Jubilado',26000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Alta',5000,'Jubilado',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Pista',5000,'Parado',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','VIP',1000,'Parado',5000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Baja',5000,'Parado',26000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Alta',5000,'Parado',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Pista',2000,'Infantil',25000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','VIP',1000,'Infantil',5000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Baja',3000,'Infantil',26000);
CALL insertarLocalidadOfertadaEvento('Barcelona','C. Aristides Maillol','12','Estadio','Harry Styles','Concierto','Grada Alta',2000,'Infantil',25000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Pista',10000,'Adulto',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','VIP',5000,'Adulto',10000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Baja',10000,'Adulto',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Alta',10000,'Adulto',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Pista',3000,'Jubilado',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','VIP',2000,'Jubilado',10000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Baja',3000,'Jubilado',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Alta',3000,'Jubilado',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Pista',3000,'Parado',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','VIP',2000,'Parado',10000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Baja',3000,'Parado',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Alta',3000,'Parado',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Pista',2000,'Infantil',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','VIP',1000,'Infantil',10000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Baja',2000,'Infantil',18000);
CALL insertarLocalidadOfertadaEvento('Madrid','Av. de Luis Aragones','4','Estadio','Coldplay','Concierto','Grada Alta',2000,'Infantil',18000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Rio',5000,'Adulto',10000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Tribuna',3000,'Adulto',8000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Fondo Sur',10000,'Adulto',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol',10000,'Adulto',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Rio',2000,'Jubilado',10000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Tribuna',2000,'Jubilado',8000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Fondo Sur',4000,'Jubilado',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol',4000,'Jubilado',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Rio',2000,'Parado',10000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Tribuna',2000,'Parado',8000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Fondo Sur',4000,'Parado',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol',4000,'Parado',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Rio',1000,'Infantil',10000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Tribuna',1000,'Infantil',8000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Fondo Sur',2000,'Infantil',20000);
CALL insertarLocalidadOfertadaEvento('Sevilla','Av. de Heliopolis','s/n','Estadio','Betis-Getafe','Futbol','Gol',2000,'Infantil',20000);

