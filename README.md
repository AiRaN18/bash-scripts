# Bash scripting para automatizacion de tareas en entornos LINUX

Buenas practicas:

1) Plantear el script que queremos hacer en pseudocódigo y un diagrama de flujo.
Muchas veces plantear el script en pseudocódigo es interesante para tener un mejor “scope” en el script. Un diagrama de flujo nos ayudaría a ver como avanzaría nuestro
script y como reaccionaría frente ciertos bucles o condiciones. Es muy recomendable si estás aprendiendo a programar.

2) Cuando hagamos comentarios debemos hacerlo con la intención de que cualquier persona pueda entender tu código, por eso debe ser claro y conciso

3) Las variables tienen que ser todo lo adaptables posible, es decir, asegurarnos que si movemos el script de un directorio a otro, éste sigue funcionando igual.
Para asegurar esto, lo ideal es usar rutas absolutas o variables de entorno

4) Si el script es largo o complejo, podemos acompañarlo de un fichero de leeme que te explique como usarlo y que tener en cuenta. También podemos crear una sección “info”
Dentro del script.

5) Es interesante controlar la salida (errores o información) creando logs. Simplemente redireccionando cierta información de forma condicional a un fichero, podemos saber
En que punto y por que está fallando el script.

6) Seguir un criterio nemotécnico nos puede ayudar a programar con más facilidad. Por ejemplo, podemos decidir que todas las variables serán nombradas con 3 carácter.

Debug mode:
sh -x script.sh 
bash -n script.sh(syntaxys check)
set -u( inside the script it will detect syntaxis errors)
  
