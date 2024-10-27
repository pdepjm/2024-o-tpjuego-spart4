import muros.*

import movimiento.*

class Jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {

  method jugador() = true

  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisual(self)
  }

  var property valor = "helado.png"

  method image() = valor

  method eliminate(){
    game.removeVisual(self)
  }
}

object points{
  var puntosObtenidos = 0
  method sumarFrutas(){
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