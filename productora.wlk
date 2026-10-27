object productora {
    var impuesto = 0.1
    const asistentes = []
    const bandas = #{} //utilizacion de set porque no queremos que se repitan bandas.

    method impuesto() = impuesto
    method cambiarImpuesto(nuevoImpuesto) {
        impuesto = nuevoImpuesto
    }

    method entradasVendidasDe(banda) = asistentes.sum({ asistente => asistente.cantidadEntradasPara(banda) })

    method presupestoBandas() = bandas.sum({elemento => elemento.presupuesto()})
    method recaudacion() = asistentes.sum({asistente => asistente.gastoTotal()})

    method gananciaTotal() = self.recaudacion() - self.presupestoBandas()

    method cantidadEntradas() = asistentes.sum({asistente => asistente.showsAsistidos()})
    method masPopular() = bandas.max( {banda => self.entradasVendidasDe(banda)} )

    method bonificarAsistentesVip() {
        asistentes.forEach({asistente => asistente.bonificarAbono()}) //polimorfismo => vip y fan deben entender bonificar Abono()
    }
}





