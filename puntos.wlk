import jugador.*
import muros.*
class Fruta{
	var property position = posicionAleatoria.generarPosicionAleatoria()

	method jugador() = false

	method image(){
		if(points.frutasObtenidas() < 10){
			return spawn.puntos().get(0)
		} else if(points.frutasObtenidas() < 20){
			return spawn.puntos().get(1)
		} else {
			return spawn.puntos().get(2)
		}
	}

  	method esFruta() = true
  	method ubicarYDibujar(posicion){
        self.position(posicion)
        game.addVisual(self)
    }
}

object spawn{
	method dibujarFrutas(){
		(0..9).forEach({x => new Fruta().ubicarYDibujar(posicionAleatoria.generarPosicionAleatoria())})
	}

	var property puntos = []
}

object posicionAleatoria {
	method generarPosX() = 1.randomUpTo(game.width() - 1).truncate(0)
	method generarPosY() = 1.randomUpTo(game.height() - 1).truncate(0)

	method generarPosicionAleatoria(){
		const x = self.generarPosX()
		const y = self.generarPosY()
		
		if(escenario.mismaPosicion(game.at(x, y)) || escenario.mismaPosicionFruta(game.at(x, y))){
			return self.generarPosicionAleatoria()
		}
		escenario.enlistarObjeto(game.at(x, y))
		return game.at(x, y)
	}
}