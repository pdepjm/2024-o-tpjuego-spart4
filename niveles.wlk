import miscelaneos.*
import muros.*
import enemigos.*
object niveles{
    const property listaPosiciones = []
    const property listaPuntos = []
    const property listaBloques = []
    const property listaEnemigos = []
    var property nivel = 0

    const nivel1 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,b,b,b,n,n,n,n,n,e,n,n,b,b,b,n,n],
                    [n,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,n],
                    [n,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,n],
                    [n,n,b,e,b,n,n,n,n,n,n,n,n,b,n,b,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n],
                    [n,n,n,b,n,n,n,n,b,b,n,n,n,n,b,n,n,n],
                    [n,n,n,n,b,b,n,n,b,b,n,n,b,b,n,n,n,n],
                    [n,n,n,n,n,n,b,b,n,n,b,b,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,e,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,n]]
                    
    const nivel2 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,n,n,n,n,n,n,n,n,b,b,b,n,n,n],
                    [n,b,n,n,n,n,n,n,b,n,n,n,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n],
                    [n,b,b,b,n,n,n,n,n,n,n,b,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,b,n,n,b,n,n,n],
                    [n,n,n,n,n,b,b,b,n,n,n,b,n,n,b,n,n,n],
                    [n,n,n,n,n,b,n,b,n,n,n,b,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,b,n,n,n,b,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,b,n,n,n,b,b,b,b,n,n,n],
                    [n,b,n,n,b,n,n,b,n,n,n,n,n,n,n,n,n,n],
                    [n,b,n,n,b,n,n,b,n,n,n,n,n,n,n,b,n,n],
                    [n,b,n,n,b,b,b,b,n,n,n,n,n,n,n,n,n,n],
                    [n,b,n,n,n,n,n,n,n,n,n,n,n,b,n,n,n,n],
                    [n,n,n,n,n,b,b,b,b,b,b,b,b,b,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,n]]

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

    method activarEnemigos() = listaEnemigos.forEach({enemigo => enemigo.activar_enemigo()})

    method limpiarBloques() = listaBloques.forEach({block => block.quitarBloque() listaBloques.remove(block)})
    method limpiarPuntos() = listaPuntos.forEach({punto => listaPuntos.remove(punto)})
    method limpiarEscenario() {
      self.limpiarBloques()
      self.limpiarPuntos()
    }

    method mismaPosicion(posiblePosicion) = listaPosiciones.any({posicion => posicion == posiblePosicion})
    method mismaPosicionPunto(posiblePosicion) = listaPuntos.any({posicion => posicion == posiblePosicion})
    method quitarPosicion(posiblePosicion){ self.listaPosiciones().remove(self.listaPosiciones().find({posicion => posicion == posiblePosicion})) }

    method enlistarObjeto(cosa) = listaPuntos.add(cosa)
    method enlistarBloque(block) = listaBloques.add(block)

    method quitarObjeto(cosa) = listaPuntos.remove(cosa)
    method sacarBloqueDeLista(block) = listaBloques.remove(block)

    method enlistarEnemigo(enemigo) = listaEnemigos.add(enemigo)
    method quitarEnemigo(enemigo) = listaEnemigos.remove(enemigo)
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

object e{
    method decodificar(x, y){
        niveles.enlistarEnemigo(new Enemigo1(vida = 100, position = game.at(x, y)))
    }
    method decodificarSuperior(x,y){}
}