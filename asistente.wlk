import Exception.*

class Asistentes {
    var abono
    const historialEntradas = []
    var dineroDisponible
    const fechaActual = new Date()

    method calculoPrecioFinal (entrada){
       return entrada.precioFinal() * ( 1 - abono.descuento()) //polimorfismo => vip y fan deben entender descuento()
    }

    method comprarEntrada(entrada){
        try {
        if(dineroDisponible > 0){
            dineroDisponible -= self.calculoPrecioFinal(entrada)
            historialEntradas.add(entrada)
        }
        else {
            throw new NoSePuedeComprar()
        }
        } catch error: NoSePuedeComprar {
            console.println(error.message())
        }
    }

    method entradasAñoAnterior(){
        return historialEntradas.filter({elemento => elemento.year() == fechaActual.year() - 1})
    }

    method nombreBandas(){
        historialEntradas.map({elemento => elemento.nombreBanda()})
    }

    method showsAsistidos() = historialEntradas.size()

    method gastoTotal() = historialEntradas.sum({entrada => entrada.precioFinal()})

    method cantidadEntradasPara(banda) = historialEntradas.count({ entrada => entrada.banda() == banda })

    method bonificarAbono() {
        abono.bonificar()
    }

}

class NoSePuedeComprar inherits Exception (message = "No se puede comprar"){}


/* polimorfismo, tanto vip como fan deben reconocer descuento y bonificar. El mensaje descuento y bonificar son las interfaces. El calculo del descuento no depende
del asistente, si no del abono que tenga. La bonificacion no depende de la productora, si no de cada tipo de abono.
Por lo tanto tambien se utiliza el concepto de encapsulamiento.

hecho como clase debido a que cada asistente tiene su propio descuento
*/
class Vip {
    var property descuento = 0.1
     method bonificar() {
        descuento += 0.01
    }
}

object fan {
    const property descuento = 0
     method bonificar(){}
}
