import muros.*

import jugador.*

class FiguraConMovimiento{
    const property position = new PosicionVariable(x = 1, y = 1)

   method equisCorrecta(equis) = equis >= 1 && equis <= (game.width()-2)

   method yeCorrecta(ye) = ye >= 1 && ye <= (game.height()-2)

   method position(posicion){
        if(self.equisCorrecta(posicion.x()) && self.yeCorrecta(posicion.y()) && !escenario.mismaPosicion(posicion)){
            self.position().establecerPos(posicion.x(), posicion.y())
        }
    }
}