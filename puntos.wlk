import muros.*
import miscelaneos.*
import niveles.*
import jugador.*


class Punto{
	var property position = posicionAleatoria.generarPosicionAleatoria()
	var valor = spawn.puntos().get(0)
	method impactado() = null

	method image(){
		return valor
	}

  	method ubicarYDibujar(posicion, indice){
		if(indice == 2){
			valor = spawn.puntos().get(1)
		} else if (indice == 3){
			valor = spawn.puntos().get(2)
		}
        self.position(posicion)
        game.addVisual(self)
    }

	method eliminarPunto(){
		game.removeVisual(self)
	}
}

object spawn{
	method dibujarPuntos(indice){
		(0..9).forEach({x => new Punto().ubicarYDibujar(posicionAleatoria.generarPosicionAleatoria(), indice)})
	}

	var property puntos = ["pu_bananas.png","pu_uva.png","pu_sandia.png"]
}


object posicionAleatoria {
	method generarPosX() = 1.randomUpTo(game.width() - 1).truncate(0)
	method generarPosY() = 1.randomUpTo(game.height() - 1).truncate(0)

	method generarPosicionAleatoria(){
		const x = self.generarPosX()
		const y = self.generarPosY()
		
		if(niveles.mismaPosicion(game.at(x, y)) || niveles.mismaPosicionPunto(game.at(x, y))){
			return self.generarPosicionAleatoria()
		}
		niveles.enlistarObjeto(game.at(x, y))
		return game.at(x, y)
	}
}
/*
	method image(){
		if(points.puntosObtenidos() < 10){
			return spawn.puntos().get(0)
		} else if(points.puntosObtenidos() < 20){
			return spawn.puntos().get(1)
		} else {
			return spawn.puntos().get(2)
		}
	}
		method ubicarYDibujar(posicion){
        self.position(posicion)
        game.addVisual(self)
    }

object spawn{
	method dibujarPuntos(){
		(0..9).forEach({x => new Punto().ubicarYDibujar(posicionAleatoria.generarPosicionAleatoria())})
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
}*/