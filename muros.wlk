import niveles.*
import miscelaneos.*

class Bloque inherits ObjetoVisible{
	var property position = game.center()
	method image() = visual.valor()
    method ubicarYDibujar(x,y){
        self.position(game.at(x,y))
        game.addVisual(self)
        escenario.enlistarBloque(self)
    }
    method quitarBloque() = game.removeVisual(self)

    override method soyBloque() = true 
}
class BloqueSuperior inherits ObjetoVisible{
	var property position = game.center()
	method image() = visualSuperior.valor()
    method ubicarYDibujar(x,y){
        self.position(game.at(x,y))
        game.addVisual(self)
    }
    method quitarBloque() = game.removeVisual(self)

    //override method soyBloque() = true
}

object visual{
    var property valor = "b_fiesta_i.png"
}
object visualSuperior{
    var property valor = "b_fiesta_sup.png"
}

object escenario{
    const listaPosiciones = []
    const listafrutas = []
    const listaBloques = []
    var property nivel = 0

    method generarEscenario(){
        (16 .. 0).forEach({y => const listaAux = niveles.entregarFila(17-y, nivel)
						        (0..17).forEach({x => const aux = listaAux.get(x)
								 			          if(aux == 1){listaPosiciones.add(game.at(x,y)) 
                                                                   new Bloque().ubicarYDibujar(x,y)}
										        })
					    })
    }
    method generarBloquesSuperiores(){//para crear la ilusion de que el jugador está detrás del bloque
        (16 .. 0).forEach({y => const listaAux = niveles.entregarFila(17-y, nivel)
						        (0..17).forEach({x => const aux = listaAux.get(x) if(aux == 1){new BloqueSuperior().ubicarYDibujar(x, y)}})
					    })
    }

    method generarLateralSuperior(){
        (17..0).forEach({x => listaPosiciones.add(game.at(x,17)) new Bloque().ubicarYDibujar(x,17)})
    }

    method limpiarBloques() = listaBloques.forEach({block => block.quitarBloque() listaBloques.remove(block)})
    method limpiarFrutas() = listafrutas.forEach({fruta => listafrutas.remove(fruta)})
    method limpiarEscenario() {
      self.limpiarBloques()
      self.limpiarFrutas()
    }

    method mismaPosicion(posiblePosicion) = listaPosiciones.any({posicion => posicion == posiblePosicion})
    method mismaPosicionFruta(posiblePosicion) = listafrutas.any({posicion => posicion == posiblePosicion})

    method enlistarObjeto(cosa) = listafrutas.add(cosa)
    method enlistarBloque(block) = listaBloques.add(block)

    method quitarObjeto(cosa) = listafrutas.remove(cosa)
    method sacarBloqueDeLista(block) = listaBloques.remove(block)
}