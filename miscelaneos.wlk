import jugador.*

object fondo_de_pausa{
    var property position = game.origin()
    method image() = "pausa.png"
}

object ganaste{
    var property position = game.origin()
    method image() = "ganaste2.png"
}

object perdiste{
    var property position = game.origin()
    method image() = "perdiste2.png"
}

object menuPersonajes{
    var property position = game.origin()
    method image() = "FondoSeleccion1.png"
}

object marcoDeSeleccion{
    var property position = game.at(2,5)
    method image() = "si.png"
}

object menuNiveles{
    var property position = game.origin()
    method image() = "niveles2.png"
}

class SeleccionNivel{
    var property position = game.at(1, 11)
    method image() = "nivel_s.png"
}

class SeleccionGanaste{
    var property position = game.at(6, 5)
    method image() = "nivel_s.png"
}

class SeleccionPerdiste{
    var property position = game.at(6, 5)
    method image() = "nivel_s.png"
}

object bloqueado{
    var property position = game.at(1, 1)
    method image() = "bloqueado.png"
}

object finDelJuego{
    var property position = game.origin()
    method image() = "PantallaFinal.png"
}

object fondoJuego{
    var property position = game.origin()
    var property valor = "f_slime.png"
    method image() = valor
    /*method image(){
        if(jugador.image() == "helado.png"){
            return "f_slime.png"
        } else if(jugador.image() == "piopio.png"){
            return "f_pio.png"
        } else {
            return "f_pasto.png"
        }
    }*/
}