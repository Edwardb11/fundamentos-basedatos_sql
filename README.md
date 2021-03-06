### Apuntes馃捇

___El lenguaje SQL, o Lenguaje de Consulta Estructurada___ es el principal medio para el acceso a la informaci贸n de las bases de datos en cualquier proyecto. Con este lenguaje hacemos las tareas m谩s comunes, denominadas CRUD (Crear, Leer, Actualizar y Eliminar, por sus siglas en ingl茅s).馃摂馃摉


___Ciclo de vide del desarrollo de una BD___

Aunque no existe un paradigma totalmente definitivo para el ciclo de vida de desarrollo de una base de datos, al menos s铆 podemos encontrar una serie de etapas que deben estar presentes para el dise帽o de la misma:
1. _An谩lisis de las necesidades._
2. _Estudio de viabilidad._
3. _Definici贸n de requisitos._
4. _Dise帽o conceptual / l贸gico._
5. _Implementaci贸n._
6. _Evaluaci贸n y mantenimiento._
 


 ___Modelado de Entidades___
  La idea es que se identifiquen los objetos de la base de datos, llamadas entidades. 
  1. _Definir entidades._ 
2.  _Definir los atributos._ 

___Modelo  Entidad-Relaci贸n (ER)___
Es sencillo dise帽ar una base de datos, pero a menudo hay que reconsiderar posteriormente la estructura de los datos, lo cual ocasiona retrasos y modificaciones. Es m谩s lento la obtenci贸n de un dise帽o lo m谩s 贸ptimo posible, pero el tiempo invertido se recupera al no tener que volver atr谩s para replantearse el dise帽o de los datos. Un buen dise帽o es la clave para iniciar con buen pie el desarrollo de una aplicaci贸n basada en una base de datos o la implementaci贸n de un sistema.馃摮

___Cardinalidad___
Cardinalidad es el n煤mero de entidades con la cual otra entidad puede asociar mediante una relaci贸n binaria; la cardinalidad puede ser: Uno a uno, uno a muchos o muchos a uno y muchos a muchos.

___Proceso de normalizaci贸n___
La normalizaci贸n de bases de datos es un proceso que consiste en designar y aplicar una serie de reglas a las relaciones obtenidas tras el paso del modelo entidad-relaci贸n al modelo relacional con objeto de minimizar la redundancia de datos, facilitando su gesti贸n posterior.馃摂馃摉
-  __1NF:__ Elimina duplicados y crea tablas separadas para grupos de datos relacionados.
- __2NF:__ Elimina subgrupos de datos en m煤ltiples filas de una tabla y crea tablas nuevas, con relaciones entre ellas.
- __3NF:__ Elimina columnas que no dependen de la clave principal.
