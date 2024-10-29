import enemigos.*
import muros.*

import menus.*

import movimiento.*

class Jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {

  method jugador() = true

  method posicionate(){
    //self.position().clear()
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
  }

  method volver(){
    if(sincronizadorDePantallas.pantallaActual() == "jugar"){
      game.addVisualCharacter(self)
    }
  }

  var property valor = "helado.png"

  method image() = valor

  method recolectar(fruta){
    game.removeVisual(fruta)
  }

  method eliminate(){
    game.removeVisual(self)
  }

  method impactado() {
    self.eliminate()
    sincronizadorDePantallas.cambiarPantalla("perdedor") 
    new MenuPerdiste().cargar()
  }

  method atacarDerecha() = new KamehamehaDerecha().energia(self.position(), "goku_Kamehameha_Derecha.png", 1)
  method atacarIzquierda() = new KamehamehaIzquierda().energia(self.position(), "goku_Kamehameha_Izquierda.png", -1)
}

object datosJugador {
  var property imagen = null
}

object gokuAtacando {
  var property position = null
  var property lado = null
  method image() = lado
  
  method impactado(){
    //game.allVisuals().filter({objeto => objeto.image() == KamehamehaDerecha.image() || objeto.image() == KamehamehaIzquierda.image()}).head()
    sincronizadorDePantallas.cambiarPantalla("perdedor") 
    //new MenuPerdiste().cargar()
  }

  method eliminate(){
    game.removeVisual(self)
  }

}

class KamehamehaDerecha{
  var personaje = null
  var property impacto = 0
  
  var property position = null
  
  method image() = "kamehameha_Derecha.png"

  method impactado() {
    //game.allVisuals().filter({objeto => objeto.image() == Enemigo1.image()}).head().herido()
    lineaEnemiga.enemigo().herido()
    self.impacto(1)
  }

  method energia(posicion, lado, valor){
    gokuAtacando.lado(lado)
    gokuAtacando.position(posicion)
    self.position(game.at(posicion.x() + valor, posicion.y()))
    if(!escenario.mismaPosicion(self.position())){
      game.addVisual(gokuAtacando)
      personaje = game.allVisuals().filter({objeto => objeto.image() == datosJugador.imagen()}).head()
      game.removeVisual(game.allVisuals().filter({objeto => objeto.image() == datosJugador.imagen()}).head())
      game.addVisual(self)
      game.schedule(500, {self.avanzar()})
    }
  }

  method lugarValido() = escenario.mismaPosicion(self.position())

  method avanzar(){
    if(!escenario.mismaPosicion(game.at(self.position().x() + 1, self.position().y())) && self.position().x() + 1 < game.width() - 1 && impacto < 1 && sincronizadorDePantallas.pantallaActual() != "perdedor"){
      self.position(game.at(self.position().x() + 1, self.position().y()))
      game.schedule(500, {self.avanzar()})
    }
    else{
      personaje.position(gokuAtacando.position())
      personaje.volver()
      self.eliminate()
      gokuAtacando.eliminate()
      if(sincronizadorDePantallas.pantallaActual() == "perdedor"){
        new MenuPerdiste().cargar()
      }
    }
  }

  method eliminate(){
    //game.removeVisual(gokuAtacando)
    game.removeVisual(self)
  }
}

class KamehamehaIzquierda inherits KamehamehaDerecha{
  override method image() = "kamehameha_Izquierda.png"

  override method avanzar(){
    if(!escenario.mismaPosicion(game.at(self.position().x() - 1, self.position().y())) && self.position().x() - 1 > 0 && impacto < 1 && sincronizadorDePantallas.pantallaActual() != "perdedor"){
      self.position(game.at(self.position().x() - 1, self.position().y()))
      game.schedule(500, {self.avanzar()})
    }
    else{
      personaje.position(gokuAtacando.position())
      personaje.volver()
      self.eliminate()
      gokuAtacando.eliminate()
      if(sincronizadorDePantallas.pantallaActual() == "perdedor"){
        new MenuPerdiste().cargar()
      }
    } 
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