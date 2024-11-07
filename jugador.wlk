import enemigos.*
import muros.*
import musica.*

import menus.*

import movimiento.*

class Jugador inherits FiguraConMovimiento(position = game.at(1, 1)) {
  
  method jugador() = true

  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
  }

  method volver(){
    if(sincronizadorDePantallas.pantallaActual() == "jugar"){
      musica.sonido_continue()
      game.addVisualCharacter(self)
    }
  }

  var property valor = "helado.png"

  method image() = valor

  method recolectar(fruta){
    game.removeVisual(fruta)
  }

  method eliminate(){
    musica.sonido_pause()
    game.removeVisual(self)
  }

  method impactado() {
    self.eliminate() //no debería ir acá, pero es donde mejor anda
    sincronizadorDePantallas.cambiarPantalla("perdedor") 
    new MenuPerdiste().cargar()
  }

  method atacarDerecha() = new KamehamehaDerecha().energia(self.position(), "goku_Kamehameha_Derecha.png", 1)
  method atacarIzquierda() = new KamehamehaIzquierda().energia(self.position(), "goku_Kamehameha_Izquierda.png", -1)
}

object atajos{
  method jugador() = game.allVisuals().filter({objeto => objeto.image() == datosJugador.imagen()}).head()
}

object datosJugador {
  var property imagen = null
}

object gokuAtacando {
  var property position = null
  var property lado = null
  method image() = lado
  
  method impactado(){
    sincronizadorDePantallas.cambiarPantalla("perdedor") 
  }

  method eliminate(){
    game.removeVisual(self)
  }

}

class KamehamehaDerecha{
  var personaje = null
  var property impacto = 0
  var property position = null
  const property sonido = game.sound("Kamehameha.mp3")

  method efectoSonoro() {
    self.sonido().volume(0.2)
    self.sonido().play()
  }
  
  method image() = "kamehameha_Derecha.png"

  method impactado() {
    lineaEnemiga.enemigo().herido()
    self.impacto(1)
  }

  method energia(posicion, lado, valor){
    gokuAtacando.lado(lado)
    gokuAtacando.position(posicion)
    self.position(game.at(posicion.x() + valor, posicion.y()))
    if(!escenario.mismaPosicion(self.position())){
      self.efectoSonoro()
      game.addVisual(gokuAtacando)
      personaje = atajos.jugador()
      atajos.jugador().eliminate()
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
      const jugador = new Jugador()
		  jugador.valor(datosJugador.imagen())
      jugador.position(gokuAtacando.position())
      if(sincronizadorDePantallas.pantallaActual() == "jugar"){
        jugador.volver()
      }
      self.eliminate()
      gokuAtacando.eliminate()
      if(sincronizadorDePantallas.pantallaActual() == "perdedor"){
        //jugador.eliminate()
        new MenuPerdiste().cargar()
      }
      if(sincronizadorDePantallas.pantallaActual() == "ganador"){
        //jugador.eliminate()
        new MenuGanaste().cargar()
      }
    }
  }

  method eliminate(){
    self.sonido().stop()
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
      const jugador = new Jugador()
		  jugador.valor(datosJugador.imagen())
      jugador.position(gokuAtacando.position())
      if(sincronizadorDePantallas.pantallaActual() == "jugar"){
        jugador.volver()
      }
      self.eliminate()
      gokuAtacando.eliminate()
      if(sincronizadorDePantallas.pantallaActual() == "perdedor"){
        //jugador.eliminate()
        new MenuPerdiste().cargar()
      }
      if(sincronizadorDePantallas.pantallaActual() == "ganador"){
        //jugador.eliminate()
        new MenuGanaste().cargar()
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