object helado {
  var property position = game.at(1,1)
  method image() = "helado.png"

  method recolectar(fruta){
    game.removeVisual(fruta)
  }
}

object points{
  var frutasObtenidas = 0
  method sumarFrutas(){
    frutasObtenidas += 1
  }
  method frutasObtenidas() = frutasObtenidas
	method position() = game.at(8,9)
	method text() ="Puntaje: " + frutasObtenidas + "/30"
}