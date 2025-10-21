class Hogar {
    var nivelDeMugre
    
    const nivelDeConfort

    method esBueno() = nivelDeMugre <= (nivelDeConfort / 2)

    method recibirAtaqueDe(unaPlaga) {
        nivelDeMugre += unaPlaga.nivelDeDaño()
    }
}

class Huerta {
    var capacidadDeProduccion

    var nivelDeProduccion = 10

    method cambiarNivel(nuevoNivel) {
        nivelDeProduccion = nuevoNivel
    }

    method esBueno() = capacidadDeProduccion > nivelDeProduccion

    method recibirAtaqueDe(unaPlaga) {
        if(unaPlaga.transmiteEnfermedades()) {
            capacidadDeProduccion -= (unaPlaga.nivelDeDaño() * 0.1 + 10).max(0)
        } else {
            capacidadDeProduccion -= (unaPlaga.nivelDeDaño() * 0.1).max(0)
        }
        
    }
}

class Mascota {
    var nivelDeSalud

    method esBueno() = nivelDeSalud > 250

    method recibirAtaqueDe(unaPlaga) {
        if(unaPlaga.transmiteEnfermedades()) {
            nivelDeSalud -= unaPlaga.nivelDeDaño()
        }
    }
}

class Barrio {
    const elementos = []

    method cantElementosBuenos() = elementos.count({e => e.esBueno()})

    method cantElementosNoBuenos() = elementos.count({e => !e.esBueno()})

    method esCopado() {
        return self.cantElementosBuenos() > self.cantElementosNoBuenos()
    }
}