# Justificaciones de diseño

## 1. Polimorfismo
Se utiliza polimorfismo para permitir que distintos tipos de abonos respondan a los mismos mensajes, sin necesidad de conocer su implementación específica.
En este caso, tanto Vip como fan entienden los mensajes descuento() y bonificar().

## 2. Encapsulamiento
Se aplica encapsulamiento al delegar en cada objeto la responsabilidad que le corresponde, evitando que otros objetos deban conocer los detalles de su implementación.

## 3. Herencia
Se define la superclase Banda para representar los comportamientos y atributos comunes a las distintas bandas. Las clases Rock, Trap e Indie heredan de Banda, reutilizando su implementación y definiendo los comportamientos particulares de cada tipo de banda.

## 4. Metodos abstractos
Se utilizan métodos abstractos en Banda para establecer comportamientos que deben ser definidos por sus subclases.

## 5. Uso de Set
La colección bandas de productora se implementa como un conjunto porque no se desea que una misma banda aparezca repetida.

## 6. Uso de expresiones lambda
Se utilizan expresiones lambda en operaciones sobre colecciones, como filter, map, sum, count, forEach y max.

## 7. Manejo de expresiones
Se define la excepción NoSePuedeComprar, que hereda de Exception, para representar la situación en la que un asistente no puede comprar una entrada.