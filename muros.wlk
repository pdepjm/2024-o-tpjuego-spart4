class Bloque{
	var property position = game.center() //habrá que posicionar los limites
	method image() = "bloque_slime.png"
	method soyBloque() = true
    method ubicarYDibujar(posicion){
        self.position(posicion)
        game.addVisual(self)
    }
}

object muros{
    method crearLaterales(){
        const ancho = game.width() - 1
        const alto = game.height() - 1
        (0 .. ancho).forEach({x => new Bloque().ubicarYDibujar(game.at(x, 0))}) // Borde inferior
        (0 .. ancho).forEach({x => new Bloque().ubicarYDibujar(game.at(x, alto))}) // Borde superior
        (0 .. alto).forEach({y => new Bloque().ubicarYDibujar(game.at(0, y))}) // Borde izquierdo
        (0 .. alto).forEach({y => new Bloque().ubicarYDibujar(game.at(ancho, y))}) // Borde derecho
    }
}

object escenario{
    const listan = [game.at(2,6), game.at(2,7), game.at(7,7), game.at(7,6), game.at(7,4), game.at(2,4), game.at(4,2), game.at(5,2), game.at(3,3), game.at(6,3)]
    
    method generarEscenario(){
        listan.forEach({cosa => new Bloque().ubicarYDibujar(cosa)})
    }

    method mismaPosicion(posiblePosicion) = listan.any({posicion => posicion == posiblePosicion})

    method mismaPosicionPrimeras10(posiblePosicion) = listan.take(10).any({posicion => posicion == posiblePosicion})

    method enlistarObjeto(cosa){
		listan.add(cosa)
	}

    method quitarObjeto(cosa){
		listan.remove(cosa)
	}
}