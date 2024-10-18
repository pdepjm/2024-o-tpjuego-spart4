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

object seleccion{
	var property position = game.origin()
	method image() = "nivel_s.png"
	method posicionParaNiveles() { //Posicion que tendra en la pantalla de niveles
		position = game.at(1, 11)
	}
	method posicionParaPantallaGanaste() { //Se aplica metodo para reutilizar el visual al final del juego en otra posicion
		position = game.at(6, 5)
	}
}

object bloqueado{
	var property position = game.at(1, 1)
	method image() = "bloqueado.png"
}

object finDelJuego{
	var property position = game.origin()
	method image() = "TERMINO.png"
}