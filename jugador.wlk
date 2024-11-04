import muros.*

import menus.menuPerdiste

import movimiento.*

object jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {

  method jugador() = true

  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
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