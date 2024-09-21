object nave{
    const property pasajeros = [neo, morfeo, trinity]
    // siempre apunta la misma lista/objeto con CONST

    method subirA(unPasajero){
        pasajeros.add(unPasajero)
    }

     method bajarA(unPasajero){
        pasajeros.remove(unPasajero)
    }

    method cuantosPasajerosHay() = pasajeros.size()

    method pasajeroMasVital(){
        return pasajeros.max( { p => p.vitalidad() } )
    }

    method estaElElegido() = pasajeros.any( { p => p.esElElegido() } )
    // any() es el contrario de all()


    method estaEquilibrada(){
        return 
        self.pasajeroMasVital().vitalidad() <= 
        self.pasajeroMenosVital().vitalidad()*2
    } 

    method pasajeroMenosVital(){
        return pasajeros.min( { p => p.vitalidad() } )
    }

    method chocar(){
        pasajeros.forEach( { p => p.saltar() } )
        // forEach no cambia la lista, solo actua sobre los elemetos.
        pasajeros.clear()
        // alternativa al clear() con metodo auxiliar bajarA() [ tiene un .remove() adentro]
        // pasajeros.forEach( { p => p.saltar(), self.bajarA(p) } )
    }

    method acelerar(){
        self.pasajerosSinElElegido().forEach({ p => p.saltar()})
    }
    // se dividio en subtarea para evitar aglomeramiento de codigo .filter.forEach ,etc,etc.       
    method pasajerosSinElElegido () = pasajeros.filter({ p => not p.esElElegido() })
}


object neo {
    var energia = 100

    method saltar(){
        energia = energia / 2
        // Alternativa: energia = energia * 0.5
    }

    method esElElegido() = true

    method vitalidad(){
        return energia * 0.1
    }

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method saltar(){
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = not estaCansado
        // Ahorras un if
    }

    method esElElegido() = false

    method vitalidad() = vitalidad

    method estaCansado() = estaCansado
}

object trinity{
    method vitalidad() = 0
    method saltar(){} // definir un methodo que no hace nada
    method esElElegido() = false
}
