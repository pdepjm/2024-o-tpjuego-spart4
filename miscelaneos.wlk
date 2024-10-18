object fondo_de_pausa{
	var property position = game.origin()
	method image() = "pausa.png"
}

object ganaste{
	var property position = game.origin()
	method image() = "ganaste2.png"
}

object menuPersonajes{
	var property position = game.origin()
	method image() = "FondoSeleccion.png"
}

object siSeleccionado{
	var property position = game.at(2,5)
	method image() = "si.png"
}

object menuNiveles{
	var property position = game.origin()
	method image() = "niveles2.png"
}

object seleccionNivel{
	var property position = game.at(1, 11)
	method image() = "nivel_s.png"
}

object seleccionGanaste{
	var property position = game.at(6, 5)
	method image() = "nivel_s.png"
}

object bloqueado{
	var property position = game.at(1, 1)
	method image() = "bloqueado.png"
}

object finDelJuego{
	var property position = game.origin()
	method image() = "TERMINO.png"
}