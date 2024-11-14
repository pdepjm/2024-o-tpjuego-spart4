import niveles.*
import muros.*

import jugador.*

class FiguraConMovimiento{
  const property position

  method equisCorrecta(equis) = equis >= 1 && equis <= (game.width()-2)

  method yeCorrecta(ye) = ye >= 1 && ye <= (game.height()-2)

  method position(posicion){
    if(self.equisCorrecta(posicion.x()) && self.yeCorrecta(posicion.y()) && !niveles.mismaPosicion(posicion)){
      self.position().establecerPos(posicion.x(), posicion.y())
      }
  }
}

class PosicionVariable inherits MutablePosition{
  method x(pos){
    x = pos
  }
  method y(pos){
    y = pos
  }
  method sumarPos(posX, posY){
    x = x + posX
    y = y + posY
  }
  method establecerPos(posX, posY){
    x = posX
    y = posY
  }
}