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
  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
  }
  
  var property valor = "helado.png"

  method image() = valor

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
	method position() = game.at((game.width()-3),(game.height()-1))
	method text() = "            Puntos:  " + frutasObtenidas
  method reset(){
    frutasObtenidas = 0
  }
  method image() = "barra.png"
}