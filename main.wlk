import Exception.*

class Entrada {
    const property banda
    const fecha
    const precioBase = 1000

    method precioFinal() = precioBase * productora.impuesto() 
    method nombreBanda() = banda.nombre()
    method presupuestoBanda() = banda.presupuesto()
}



object productora {
    var impuesto = 0.1
    const asistentes = []
    const bandas = #{}

    method impuesto() = impuesto
    method cambiarImpuesto(nuevoImpuesto) {
        impuesto = nuevoImpuesto
    }



    method presupestoBandas() = bandas.sum({elemento => elemento.presupuesto()})
    method recaudacion() = asistentes.sum({asistente => asistente.gastoTotal()})

    method gananciaTotal() = self.recaudacion() - self.presupestoBandas()

    method cantidadEntradas() = asistentes.sum({asistente => asistente.showsAsistidos()})
    method masPopular() = bandas.max()

}



class noSePuedeComprar inherits Exception (message = "No se puede comprar"){}



class Asistentes {
    var abono
    const historialEntradas = []
    var dineroDisponible
    const fechaActual = new Date()

    method calculoPrecioFinal (entrada){
       return entrada.precioFinal() * ( 1 - abono.descuento())
    //polimorfismo, tanto vip como fan deben reconocer el method descuento. El mensaje descuento es la interfaz. El calculo del descuento no depende
    //del asistente, si no del abono que tenga. Por lo tanto tambien se utiliza el concepto de encapsulamiento
    }

    method comprarEntrada(entrada){
        try {
        if(dineroDisponible > 0){
            dineroDisponible -= self.calculoPrecioFinal(entrada)
            historialEntradas.add(entrada)
        }
        else {
            throw new noSePuedeComprar()
        }
        } catch error: noSePuedeComprar {
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
}
//hecho como clase debido a que cada asistente tiene su propio descuento
class vip {
    var property descuento = 0.1
}

object fan {
    const property descuento = 0
}

class Banda {
    const property nombre

    method canon() = 100000

    method gastoExtra()
    method presupuesto() = self.canon() + self.gastoExtra()
    method popularidad()
}

class rock inherits Banda {
    var cantidadSolos
    override method gastoExtra() = 10000
    override method popularidad() = 100 * cantidadSolos
}

class trap inherits Banda {
    var tieneHielo
    override method gastoExtra() = 0

    override method popularidad() {
        if(tieneHielo){
            return 1000
        }
        else {
            return 0
        }
    }

    override method canon() = super() * self.popularidad()
}

class indie inherits Banda {
    var cantidadInstrumentos
    override method gastoExtra() = 500 * cantidadInstrumentos
    override method popularidad() = 3.14 * nombre.size()
}