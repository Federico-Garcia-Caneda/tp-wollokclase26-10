//utilizacion de una superclase ya que las distintas bandas tienen comportamiento en comun
class Banda {
    const property nombre

    method canon() = 100000

    //utilizacion de metodos abstractos para que las distintas bandas que heredan de Banda esten obligados a definirlos.
    method gastoExtra()
    //el calculo del presupuesto para todos es lo mismo, lo que varía es el gasto extra, por lo tanto el metodo abstracto debe ser gastoExtra().
    method presupuesto() = self.canon() + self.gastoExtra()
    method popularidad()
}

class Rock inherits Banda {
    var cantidadSolos
    override method gastoExtra() = 10000
    override method popularidad() = 100 * cantidadSolos
}

class Trap inherits Banda {
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
    //utilizacion de super() ya que necesitamos el calculo del canon de la superclase.
    override method canon() = super() * self.popularidad()
}

class Indie inherits Banda {
    var cantidadInstrumentos
    override method gastoExtra() = 500 * cantidadInstrumentos
    override method popularidad() = 3.14 * nombre.size()
}