import muros.*
import menus.menuPerdiste
import movimiento.*
import miscelaneos.*
import niveles.*

object jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {

  // override method jugador() = true

  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
    modificadorMapa.eventosDelTeclado()
  }

  var property valor = "p_helado.png"

  method image() = valor

  method eliminate(){
    game.removeVisual(self)
  }
}

object points{
  var puntosObtenidos = 0
  method sumarPuntos(){
    puntosObtenidos += 1
  }
  method puntosObtenidos() = puntosObtenidos
    method position() = game.at((game.width()-3),(game.height()-1))
    method text() = "            Puntos:  " + puntosObtenidos
  method textColor() = "FF0000FF"
  method reset(){
    puntosObtenidos = 0
  }
  method image() = "barra.png"
}

object modificadorMapa{

    var property position = jugador.position()
    var property estado_accion = ponerBloque

    method modBloques(direccion) {
      self.position(jugador.position())
      self.detectarSiguientePosicionValida(direccion)
    }

    method detectarSiguientePosicionValida(direccion){
        self.moverPuntero(direccion)

        if(niveles.mismaPosicion(self.position())) self.estado_accion(quitarBloque)
        self.estado_accion().realizarAccion(self.position())

        game.onTick(100, "mover-puntero", {
          self.moverPuntero(direccion)
          self.estado_accion().realizarAccion(self.position())
        })
    }

    method eventosDelTeclado() {
      keyboard.d().onPressDo({ self.modBloques(moverDerecha) })
      keyboard.s().onPressDo({ self.modBloques(moverAbajo) })
      keyboard.a().onPressDo({ self.modBloques(moverIzquierda) })
      keyboard.w().onPressDo({ self.modBloques(moverArriba) })
    }

    method removerPuntero() {
      game.removeTickEvent("mover-puntero")
      self.estado_accion(ponerBloque)
    }

    method moverPuntero(direccion){
        position = position.left(direccion.vector().get(0))
                    .down(direccion.vector().get(1))
                    .right(direccion.vector().get(2))
                    .up(direccion.vector().get(3))
        }
}

object ponerBloque{
  method realizarAccion(posicion){
    if(!niveles.mismaPosicion(posicion)){
      b.decodificar(posicion.x(), posicion.y())
      new BloqueSuperior().ubicarYDibujar(posicion.x(), posicion.y())
    }
    else{
      modificadorMapa.removerPuntero()
    }
  }
}

object quitarBloque {
  method realizarAccion(posicion) {
    if(niveles.mismaPosicion(posicion) && posicion.x() >= 1 && posicion.x() <= (game.width()-2) && posicion.y() >= 1 && posicion.y() <= (game.height()-2)){
      niveles.quitarPosicion(posicion)
      game.getObjectsIn(posicion).get(game.getObjectsIn(posicion).size() - 1).quitarBloque()
      game.getObjectsIn(posicion).get(game.getObjectsIn(posicion).size() - 1).quitarBloque()
    }
    else{
      modificadorMapa.removerPuntero()
    }
  }
}