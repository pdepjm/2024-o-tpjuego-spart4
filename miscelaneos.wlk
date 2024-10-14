object fondo_de_pausa{
	var property position = game.origin()
	method image() = "pausa.png"
}

object ganaste{
	var property position = game.at(0,3)
	method image() = "ganaste.png"
}

object menuPersonajes{
	var property position = game.origin()
	method image() = "FondoSeleccion2.png"
}

object noSeleccionado{
	var direccion = 1
	method direccion(numero){
		direccion = numero
	}
	method position() = if(direccion == 1) game.at(2,5) else game.at(10,5) 
	method image() = "no.png"
}

object siSeleccionado{
	var direccion = 0
	method direccion(numero){
		direccion = numero
	}
	method position() = if(direccion == 0) game.at(10,5) else game.at(2,5) 
	method image() = "si.png"
}

object menuNiveles{
	var property position = game.origin()
	method image() = "niveles.png"
}

object seleccion{
	var property position = game.at(1, 11)
	method image() = "nivel_s.png"
}

object bloqueado{
	var property position = game.at(1, 1)
	method image() = "bloqueado.png"
}