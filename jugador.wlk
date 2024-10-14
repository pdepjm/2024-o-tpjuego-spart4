import muros.*

object jugador {
  var position = game.at(1,1)

  method position() = position

  method equisCorrecta(equis) = equis >= 1 && equis <= (game.width()-2)

  method yeCorrecta(ye) = ye >= 1 && ye <= (game.height()-2)

  method position(posicion){
    if(self.equisCorrecta(posicion.x()) && self.yeCorrecta(posicion.y()) && !escenario.mismaPosicion(posicion)){
      position = game.at(posicion.x(), posicion.y())
    }
  }

  var valor = 0
  method valor(numero){
    valor = numero
  }
  
  method image(){
    if(valor == 0){
      return "goku2.png"
    } else {
      return "helado.png"
    }
  }

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
	method position() = game.at((game.width()-2),(game.height()-1))
	method text() ="Puntaje: " + frutasObtenidas + "/30"
}