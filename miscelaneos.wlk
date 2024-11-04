//IMAGENES DE PANTALLAS
object ganaste{
    var property position = game.origin()
    method image() = "PP_victoria.png"
}
object perdiste{
    var property position = game.origin()
    method image() = "PP_derrota.png"
}
object menuPersonajes{
    var property position = game.origin()
    method image() = "PP_personajes.png"
}
object menuNiveles{
    var property position = game.origin()
    method image() = "PP_niveles.png"
}
object finDelJuego{
    var property position = game.origin()
    method image() = "PP_final.png"
}

//IMAGENES DE SELECCION
object marcoDeSeleccion{
    var property position = game.at(2,5)
    method image() = "S_personajes.png"
}
object seleccionNivel{
    var property position = game.at(1, 11)
    method image() = "S_niveles.png"
}
object seleccionGanaste{
    var property position = game.at(6, 5)
    method image() = "S_niveles.png"
}
object seleccionPerdiste{
    var property position = game.at(5, 5)
    method image() = "S_derrota.png"
}

//BACKGROUND
object fondoJuego{
    var property position = game.origin()
    var property valor = "f_slime.png"
    method image() = valor
}