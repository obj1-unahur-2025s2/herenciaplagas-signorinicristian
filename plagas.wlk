class Plaga {
    var poblacion

    method transmiteEnfermedades() = poblacion >= 10

    method atacar() {
        poblacion += poblacion * 0.1
    }
}

class PlagaDeCucarachas inherits Plaga {
    var pesoPromedio 

    method nivelDeDaño() = poblacion / 2

    override method transmiteEnfermedades() {
        return super() && pesoPromedio >= 10
    } 

    method pesoPromedio() = pesoPromedio

    override method atacar() {
        super()
        pesoPromedio += 2
    }
}

class PlagaDePulgas inherits Plaga {
    method nivelDeDaño() = poblacion * 2
}   

class PlagaDeGarrapatas inherits PlagaDePulgas {
    override method atacar() {
        poblacion += poblacion + (poblacion * 0.2)
    }
}

class PlagaDeMosquitos inherits Plaga {
    method nivelDeDaño() = poblacion

    override method transmiteEnfermedades() {
        return super() && poblacion % 3 == 0
    } 
}