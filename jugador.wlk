import muros.*

import menus.menuPerdiste

import movimiento.*

import miscelaneos.*

object jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {

  override method jugador() = true

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

object points inherits ObjetoVisible{
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

object modificadorMapa inherits ObjetoVisible{

    var property position = jugador.position()

    method modBloques(direccion) {
      game.addVisual(self)
      self.position(jugador.position())
      self.detectarSiguientePosicionValida(direccion)
    }

    method eventosDelTeclado() {
      keyboard.d().onPressDo({ self.modBloques(moverDerecha) })
      keyboard.s().onPressDo({ self.modBloques(moverAbajo) })
      keyboard.a().onPressDo({ self.modBloques(moverIzquierda) })
      keyboard.w().onPressDo({ self.modBloques(moverArriba) })
    }

    method realizarAccion(accion, direccion){
        if(accion == 2){
            self.ponerBloques()
            game.onTick(20, "mover-puntero", {self.moverPuntero(direccion) self.ponerBloques()})
        }
        if(accion == 1){
            self.quitarBloques()
            game.onTick(20, "mover-puntero", {self.moverPuntero(direccion) self.quitarBloques()})
        }
        if(accion == -1){
            self.removerPuntero()
        }
    }

    method removerPuntero() {
      game.removeTickEvent("mover-puntero")
      game.removeVisual(self)
    }

    method detectarSiguientePosicionValida(direccion){
        var respuesta = 2
        self.moverPuntero(direccion)
        if(game.getObjectsIn(self.position()).any({elemento => return elemento.soyBloque()})) {respuesta = 1}
        else if(game.getObjectsIn(self.position()).any({elemento => return elemento.esEnemigo()})) {respuesta = -1}
        self.realizarAccion(respuesta, direccion)
    }

    method quitarBloques(){
        if(game.getObjectsIn(self.position()).any({elemento => return elemento.soyBloque()})){
            game.removeVisual(game.getObjectsIn(self.position()).find({elemento => return elemento.soyBloque()}))
            //self.position(game.at(self.position().x(), self.position().y() + 1))
            //game.removeVisual(game.getObjectsIn(self.position()).find({elemento => return elemento.esBloqueSuperior()}))
            //self.position(game.at(self.position().x(), self.position().y() - 1))
        }
        else{
            self.removerPuntero()
        }
    }

    method ponerBloques(){
        if(game.getObjectsIn(self.position()).any({elemento => return elemento.soyBloque()})){
            self.removerPuntero()
        }
        else{
            new Bloque().ubicarYDibujar(self.position().x(), self.position().y())
            new BloqueSuperior().ubicarYDibujar(self.position().x(), self.position().y())
        }
    }

    method moverPuntero(direccion){
        position = position.left(direccion.vector().get(0))
                    .down(direccion.vector().get(1))
                    .right(direccion.vector().get(2))
                    .up(direccion.vector().get(3))
        }
}