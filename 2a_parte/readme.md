RESPUESTA A LA PREGUNTA 1
=========================

- web service
  Elijo: rolling deploy. La información que se muestra a los usuarios entrantes, bajo mi punto de vista, no puede tener interrupciones por cambios de versión.

- pricing service
  Elijo recreate. La información de la facturación es vital para la empresa y si se realizan cambios estos deben ser consistentes para todos los usuarios.
  Los daños causados por diferentes versiones en producción en caso de malfuncionamiento pueden ser una publicidad desastrosa o ruinosa según se de el caso. 
  Ejemplos:
     https://www.splink.es/peor-error-una-tienda-online-de-exito/
     https://www.20minutos.es/gonzoo/noticia/4144240/0/error-precios-web-comercio-online-sofas-viral-twitter/
     https://elpais.com/sociedad/2020/02/27/actualidad/1582796975_880373.html  (Consumo da la razón a los clientes de Fnac que compraron un móvil 575 euros más barato por un error)

- backoffice service: 
  Elijo blue/green. Se evita el impacto en downtine por cambios de versión que afectarían a los tiempos en la gestión de envios.
  El personal de la empresa puede ir probando los cambios a implantar en la arquitectura real asumiendo que el coste de sobredimensionar la infraestructura no es grande al tratarse
  del backend... entiendo que en el frontend es donde se gasta más dinero (aunque realmente no lo sé al no haber trabajado nunca en ello).

- notification service :
  Elijo canary. El servicio de notificaciones me parece vital para una empresa de distribución y no puede tener interrupciones. Al poder realizar el despliegue a determinados grupos de 
  usuarios (conocidos) creo que puede minimizar al máximo los daños en caso de mal funcionamiento del código.  


RESPUESTA A LA PREGUNTA 2
=========================

SLOs:
- Número de calculos de precio erróneos con desviaciones positivas (se carga de más al cliente) < 3% 
- Número de peticiones de precio que no se sirven por error del servidor < 0.5% 
- Latencia menor a 300ms en el 99.99%


RESPUESTA A LA PREGUNTA 3
=========================

Ejemplo de traza:

{
"log_app": "pricing_service",
"log_timestamp": "2020-06-27T11:41:35+00:00",
"log_level": "INFO",
"log_message": "Princing request code XXXX"
}


RESPUESTA A LA PREGUNTA 4
=========================

Pondría el servicio "Web Service" en alta disponibilidad con un número elevado de nodos. 
En el caso de fallo un enrutador desviaría el tráfico del nodo con fallo al resto de nodos. 


RESPUESTA A LA PREGUNTA 5
=========================

En caso de caída del servicio en la cola de mensajes, en mi opinión no se puede utilizar otra estrategía más que procesar los mensajes de acuerdo a un procesamiento
FIFO. 



