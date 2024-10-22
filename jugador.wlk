import muros.*

import menus.menuPerdiste

import movimiento.*

object jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {

  method jugador() = true

  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
  }

  var property valor = "helado.png"

  method image() = valor

  method recolectar(fruta){
    game.removeVisual(fruta)
  }

  method eliminate(){
    game.removeVisual(self)
  }
}

object points{
  var frutasObtenidas = 0
  method sumarFrutas(){
    frutasObtenidas += 1
  }
  method frutasObtenidas() = frutasObtenidas
    method position() = game.at((game.width()-3),(game.height()-1))
    method text() = "            Puntos:  " + frutasObtenidas
  method textColor() = "FF0000FF"
  method reset(){
    frutasObtenidas = 0
  }
  method image() = "barra.png"
}