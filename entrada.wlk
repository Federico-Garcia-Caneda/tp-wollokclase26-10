import productora.*

class Entrada {
    const property banda
    const fecha
    const precioBase = 1000

    method precioFinal() = precioBase * productora.impuesto() 
    
    //metodos para la utilizacion en expresiones lambda
    method nombreBanda() = banda.nombre()
    method presupuestoBanda() = banda.presupuesto()
}