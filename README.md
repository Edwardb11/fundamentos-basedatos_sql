####Apuntes💻👨‍💻📔
___El lenguaje SQL, o Lenguaje de Consulta Estructurada___ es el principal medio para el acceso a la información de las bases de datos en cualquier proyecto. Con este lenguaje hacemos las tareas más comunes, denominadas CRUD (Crear, Leer, Actualizar y Eliminar, por sus siglas en inglés).📔📖


___Ciclo de vide del desarrollo de una BD___

Aunque no existe un paradigma totalmente definitivo para el ciclo de vida de desarrollo de una base de datos, al menos sí podemos encontrar una serie de etapas que deben estar presentes para el diseño de la misma:
1. _Análisis de las necesidades._
2. _Estudio de viabilidad._
3. _Definición de requisitos._
4. _Diseño conceptual / lógico._
5. _Implementación._
6. _Evaluación y mantenimiento._
 


 ___Modelado de Entidades___
  La idea es que se identifiquen los objetos de la base de datos, llamadas entidades. 
  1. _Definir entidades._ 
2.  _Definir los atributos._ 

___Modelo  Entidad-Relación (ER)___
Es sencillo diseñar una base de datos, pero a menudo hay que reconsiderar posteriormente la estructura de los datos, lo cual ocasiona retrasos y modificaciones. Es más lento la obtención de un diseño lo más óptimo posible, pero el tiempo invertido se recupera al no tener que volver atrás para replantearse el diseño de los datos. Un buen diseño es la clave para iniciar con buen pie el desarrollo de una aplicación basada en una base de datos o la implementación de un sistema.📳

___Cardinalidad___
Cardinalidad es el número de entidades con la cual otra entidad puede asociar mediante una relación binaria; la cardinalidad puede ser: Uno a uno, uno a muchos o muchos a uno y muchos a muchos.

___Proceso de normalización___
La normalización de bases de datos es un proceso que consiste en designar y aplicar una serie de reglas a las relaciones obtenidas tras el paso del modelo entidad-relación al modelo relacional con objeto de minimizar la redundancia de datos, facilitando su gestión posterior.📔📖
-  __1NF:__ Elimina duplicados y crea tablas separadas para grupos de datos relacionados.
- __2NF:__ Elimina subgrupos de datos en múltiples filas de una tabla y crea tablas nuevas, con relaciones entre ellas.
- __3NF:__ Elimina columnas que no dependen de la clave principal.