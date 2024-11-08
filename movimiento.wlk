import muros.*
import miscelaneos.*

class FiguraConMovimiento inherits ObjetoVisible{
    var position
    method position() = position
    method equisCorrecta(equis) = equis >= 1 && equis <= (game.width()-2)
    method yeCorrecta(ye) = ye >= 1 && ye <= (game.height()-2)
    method position(posicion){
        if(self.equisCorrecta(posicion.x()) && self.yeCorrecta(posicion.y()) && !escenarioNivel.mismaPosicion(posicion)){
            position = game.at(posicion.x(), posicion.y())
        }
    }
}