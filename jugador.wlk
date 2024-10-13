import muros.*

object helado {
  var position = game.at(1,1)

  method position() = position

  method equisCorrecta(equis) = equis >= 1 && equis <= 38

  method yeCorrecta(ye) = ye >= 1 && ye <= 19

  method position(posicion){
    if(self.equisCorrecta(posicion.x()) && self.yeCorrecta(posicion.y()) && !escenario.mismaPosicionPrimeras10(posicion)){
      position = game.at(posicion.x(), posicion.y())
    }
  }

  method image() = "goku2.png"

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
	method position() = game.at(38,20)
	method text() ="Puntaje: " + frutasObtenidas + "/30"
}