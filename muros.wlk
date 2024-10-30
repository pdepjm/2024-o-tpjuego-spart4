class Bloque{
	var property position = game.center() //habrá que posicionar los limites
	method image() = visual.valor()
	method soyBloque() = true
    method ubicarYDibujar(posicion){
        self.position(posicion)
        game.addVisual(self)
        escenario.enlistarBloque(self)
    }
    method quitarBloque() = game.removeVisual(self)
}

class Bloque_mapa{
    var property position = game.center()

    const apariencia = "b_pasto.png"
	method image() = visual.valor()

	method soyBloque() = true

    method Dibujar(){
        game.addVisual(self)
    }

    method quitarBloque() = game.removeVisual(self)
}

object visual{
    var property valor = "b_fiesta.png"
}

object muros{
    method crearLaterales(){
        const ancho = game.width() - 1
        const alto = game.height()
        /*
        //(0 .. ancho).forEach({x => new Bloque().ubicarYDibujar(game.at(x, 0))}) // Borde inferior
        (0 .. ancho).forEach({x => new Bloque().ubicarYDibujar(game.at(x, alto))}) // Borde superior
        (alto .. 0).forEach({y => new Bloque().ubicarYDibujar(game.at(0, y))}) // Borde izquierdo
        (alto .. 0).forEach({y => new Bloque().ubicarYDibujar(game.at(ancho, y))}) // Borde derecho
        */
        alto.times({y => 
                        new Bloque().ubicarYDibujar(game.at(0, (alto - y)))//Comienza desde alto - y para que no se superpongan
                        new Bloque().ubicarYDibujar(game.at(ancho, (alto - y)))
                        })
    }
    method crearBordeSuperior(){
        const ancho = game.width()
        const alto = game.height() - 1
        //(0 .. ancho).forEach({x => new Bloque().ubicarYDibujar(game.at(x, 0))}) // Borde inferior
        ancho.times({x => new Bloque().ubicarYDibujar(game.at(x, alto))})
    }
    method crearBordeInferior(){
        const ancho = game.width()
        //(0 .. ancho).forEach({x => new Bloque().ubicarYDibujar(game.at(x, 0))}) // Borde inferior
        ancho.times({x => new Bloque().ubicarYDibujar(game.at(x, 0))})
    }
}//4.times({unValor => 5.times(action)})

object escenario{
    const niveles = [
        //Nivel 1
        [game.at(2,15), game.at(3,15), game.at(4,15), game.at(4,14), game.at(2,14), game.at(4,13), game.at(2,13), game.at(2,12), game.at(4,12), //ojo I
        game.at(13,15), game.at(14,15), game.at(15,15), game.at(15,14), game.at(13,14), game.at(15,13), game.at(13,13), game.at(13,12), game.at(15,12), //ojo D
        game.at(7,10), game.at(8,10), game.at(9,10), game.at(10,10), game.at(8,9), game.at(9,9), //nariz
        game.at(3,5), game.at(4,4), game.at(5,4), game.at(6,3), game.at(7,3), game.at(10,3), game.at(11,3), game.at(12,4), game.at(13,4), game.at(14,5), game.at(8,7), game.at(9,7), game.at(9,6), game.at(8,6), game.at(9,5), game.at(8,5), game.at(8,4), game.at(9,4)], //boca
        //Nivel 2
        [game.at(2,13), game.at(3,13), game.at(4,14), game.at(5,14), game.at(6,15), game.at(7,15), game.at(8,15), game.at(9,15), game.at(10,15), game.at(11,15), game.at(12,15), game.at(13,15), game.at(14,14), game.at(15,12),
         game.at(2,12), game.at(3,4),  game.at(4,11), game.at(5,11), game.at(6,12), game.at(7,13), game.at(8,13), game.at(9,13), game.at(10,13), game.at(11,13), game.at(12,13), game.at(13,11), game.at(14,13), game.at(15,11),
         game.at(2,11), game.at(3,2),  game.at(4,10), game.at(5,6),  game.at(6,9),  game.at(7,10), game.at(8,11), game.at(9,11), game.at(10,11), game.at(11,10), game.at(12,12), game.at(13,10), game.at(14,4),  game.at(15,10),
         game.at(2,10),                game.at(4,9),  game.at(5,4),  game.at(6,8),  game.at(7,8),  game.at(8,8),  game.at(9,9),  game.at(10,7),  game.at(11,9),  game.at(12,6),  game.at(13,9),                  game.at(15,9),
         game.at(2,9),                 game.at(4,8),  game.at(5,2),  game.at(6,6),  game.at(7,6),  game.at(8,6),  game.at(9,6),  game.at(10,4),  game.at(11,8),  game.at(12,3),  game.at(13,8),                  game.at(15,8),
         game.at(2,8),                 game.at(4,7),                 game.at(6,4),  game.at(7,4),  game.at(8,4),  game.at(9,4),  game.at(10,2),  game.at(11,5),                  game.at(13,7),                  game.at(15,7),
         game.at(2,7),                 game.at(4,6),                 game.at(6,2),  game.at(7,2),  game.at(8,2),  game.at(9,2),                  game.at(11,2),                  game.at(13,6),                  game.at(15,6),
         game.at(2,6),                 game.at(4,4),                                                                                                                             game.at(13,4),                  game.at(15,5),
         game.at(2,5),                 game.at(4,2)]
    ]
    var listan = niveles.get(0)
    const listafrutas = []

    method generarLista(indice){
        listan = niveles.get(indice)
    }
    const listaBloques = []

    method generarEscenario() = listan.forEach({pos => new Bloque().ubicarYDibujar(pos)})

    method limpiarBloques() = listaBloques.forEach({block => block.quitarBloque() listaBloques.remove(block)})

    method limpiarFrutas() = listafrutas.forEach({fruta => listafrutas.remove(fruta)})

    method limpiarEscenario() {
      self.limpiarBloques()
      self.limpiarFrutas()
    }

    method mismaPosicion(posiblePosicion) = listan.any({posicion => posicion == posiblePosicion})

    method mismaPosicionFruta(posiblePosicion) = listafrutas.any({posicion => posicion == posiblePosicion})

    method enlistarObjeto(cosa) = listafrutas.add(cosa)

    method quitarObjeto(cosa) = listafrutas.remove(cosa)

    method enlistarBloque(block) = listaBloques.add(block)

    method sacarBloqueDeLista(block) = listaBloques.remove(block)
}