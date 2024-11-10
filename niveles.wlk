import miscelaneos.*
import muros.*
/*
class Nivel {
    const matrizPosiciones
    method entregarFila(fila) = matrizPosiciones.get(fila)
    const property listaPosiciones = []
    const property listaPuntos = []
    const property listaBloques = []

    method generarEscenario(){
        (16 .. 0).forEach({y => const listaAux = self.entregarFila(17-y)
						        (0..17).forEach({x => const aux = listaAux.get(x)
								 			          aux.decodificar(x, y)})
                                                      })
    }
    method generarBloquesSuperiores(){//para crear la ilusion de que el jugador está detrás del bloque
        (16 .. 0).forEach({y => const listaAux = self.entregarFila(17-y)
						        (0..17).forEach({x => const aux = listaAux.get(x) aux.decodificarSuperior(x, y)})
					    })
    }

    method generarLateralSuperior(){
        (17..0).forEach({x => listaPosiciones.add(game.at(x,17)) new Bloque().ubicarYDibujar(x,17)})
    }

    method limpiarBloques() = listaBloques.forEach({block => block.quitarBloque() listaBloques.remove(block)})
    method limpiarPuntos() = listaPuntos.forEach({punto => listaPuntos.remove(punto)})
    method limpiarEscenario() {
      self.limpiarBloques()
      self.limpiarPuntos()
    }

    method mismaPosicion(posiblePosicion) = listaPosiciones.any({posicion => posicion == posiblePosicion})
    method mismaPosicionPunto(posiblePosicion) = listaPuntos.any({posicion => posicion == posiblePosicion})

    method enlistarObjeto(cosa) = listaPuntos.add(cosa)
    method enlistarBloque(block) = listaBloques.add(block)

    method quitarObjeto(cosa) = listaPuntos.remove(cosa)
    method sacarBloqueDeLista(block) = listaBloques.remove(block)
}

const nivel1 = new Nivel(
    matrizPosiciones = [[b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,n,b,b,b,n,n,n,n,n,n,n,n,b,b,b,n,b],
                        [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                        [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                        [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                        [b,n,n,b,n,n,n,n,b,b,n,n,n,n,b,n,n,b],
                        [b,n,n,n,b,b,n,n,b,b,n,n,b,b,n,n,n,b],
                        [b,n,n,n,n,n,b,b,n,n,b,b,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]]
)

const nivel2 = new Nivel(
    matrizPosiciones = [[b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,b,b,b,b,b,b,b,b,n,n,n,b],
                        [b,n,n,n,b,b,n,n,n,n,n,n,n,n,b,n,n,b],
                        [b,n,b,b,n,n,n,b,b,b,b,b,b,n,b,n,n,b],
                        [b,n,b,n,n,n,b,n,n,n,n,n,b,n,n,b,n,b],
                        [b,n,b,n,b,b,n,n,b,b,b,n,n,b,n,b,n,b],
                        [b,n,b,n,b,n,n,b,n,n,n,b,n,b,n,b,n,b],
                        [b,n,b,n,b,n,b,n,n,b,n,b,n,b,n,b,n,b],
                        [b,n,b,n,b,n,b,b,b,n,n,b,n,b,n,b,n,b],
                        [b,n,b,n,b,n,n,n,n,n,b,n,n,b,n,b,n,b],
                        [b,n,b,n,b,b,b,b,b,b,n,n,b,b,n,b,n,b],
                        [b,n,b,n,n,n,n,n,n,n,n,b,n,n,n,b,n,b],
                        [b,n,n,b,b,b,b,b,b,b,b,n,n,b,b,n,n,b],
                        [b,n,n,n,n,n,n,n,n,n,n,b,b,n,n,n,n,b],
                        [b,n,n,b,b,b,b,b,b,b,b,n,n,n,n,n,n,b],
                        [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                        [b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]]

)
*/
object niveles{
    const property listaPosiciones = []
    const property listaPuntos = []
    const property listaBloques = []
    var property nivel = 0

    const nivel1 = [[b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,b,b,b,n,n,n,n,n,n,n,n,b,b,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                    [b,n,n,b,n,n,n,n,b,b,n,n,n,n,b,n,n,b],
                    [b,n,n,n,b,b,n,n,b,b,n,n,b,b,n,n,n,b],
                    [b,n,n,n,n,n,b,b,n,n,b,b,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]]
                    
    const nivel2 = [[b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,b,b,b,b,b,b,b,b,n,n,n,b],
                    [b,n,n,n,b,b,n,n,n,n,n,n,n,n,b,n,n,b],
                    [b,n,b,b,n,n,n,b,b,b,b,b,b,n,b,n,n,b],
                    [b,n,b,n,n,n,b,n,n,n,n,n,b,n,n,b,n,b],
                    [b,n,b,n,b,b,n,n,b,b,b,n,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,b,n,n,n,b,n,b,n,b,n,b],
                    [b,n,b,n,b,n,b,n,n,b,n,b,n,b,n,b,n,b],
                    [b,n,b,n,b,n,b,b,b,n,n,b,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,b,n,n,b,n,b,n,b],
                    [b,n,b,n,b,b,b,b,b,b,n,n,b,b,n,b,n,b],
                    [b,n,b,n,n,n,n,n,n,n,n,b,n,n,n,b,n,b],
                    [b,n,n,b,b,b,b,b,b,b,b,n,n,b,b,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,b,b,n,n,n,n,b],
                    [b,n,n,b,b,b,b,b,b,b,b,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]]

    method entregarFila(fila, nivelPedido) = if(nivelPedido == 0) nivel1.get(fila) else nivel2.get(fila)

    method generarEscenario(){
        (16 .. 0).forEach({y => const listaAux = self.entregarFila(17-y, nivel)
						        (0..17).forEach({x => const aux = listaAux.get(x)
								 			          aux.decodificar(x, y)})
                                                      })
    }
    method generarBloquesSuperiores(){//para crear la ilusion de que el jugador está detrás del bloque
        (16 .. 0).forEach({y => const listaAux = self.entregarFila(17-y, nivel)
						        (0..17).forEach({x => const aux = listaAux.get(x) aux.decodificarSuperior(x, y)})
					    })
    }

    method generarLateralSuperior(){
        (17..0).forEach({x => listaPosiciones.add(game.at(x,17)) new Bloque().ubicarYDibujar(x,17)})
    }

    method limpiarBloques() = listaBloques.forEach({block => block.quitarBloque() listaBloques.remove(block)})
    method limpiarPuntos() = listaPuntos.forEach({punto => listaPuntos.remove(punto)})
    method limpiarEscenario() {
      self.limpiarBloques()
      self.limpiarPuntos()
    }

    method mismaPosicion(posiblePosicion) = listaPosiciones.any({posicion => posicion == posiblePosicion})
    method mismaPosicionPunto(posiblePosicion) = listaPuntos.any({posicion => posicion == posiblePosicion})

    method enlistarObjeto(cosa) = listaPuntos.add(cosa)
    method enlistarBloque(block) = listaBloques.add(block)

    method quitarObjeto(cosa) = listaPuntos.remove(cosa)
    method sacarBloqueDeLista(block) = listaBloques.remove(block)
}

object b {
    method decodificar(x,y) 
    {
        niveles.listaPosiciones().add(game.at(x,y)) 
        new Bloque().ubicarYDibujar(x,y)
    }
    method decodificarSuperior(x,y) = new BloqueSuperior().ubicarYDibujar(x, y)
}

object n {
    method decodificar(x,y) {}
    method decodificarSuperior(x,y){}
}