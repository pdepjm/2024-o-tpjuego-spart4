import miscelaneos.*
import enemigos.*
import muros.*
import musica.*
import niveles.*
import menus.*

import movimiento.*

class Jugador inherits FiguraConMovimiento(position = new PosicionVariable(x = 1, y = 1)){
  
  method jugador() = true

  method posicionate(){
    self.position(game.at(1, 1))
    game.addVisualCharacter(self)
    modificadorMapa.eventosDelTeclado()
  }

  method volver(){
    if(sincronizadorDePantallas.pantallaActual() == "jugar"){
      musica.sonido_continue()
      game.addVisualCharacter(self)
    }
  }

  var property valor = null

  method image() = valor

  method recolectar(punto){
    game.removeVisual(punto)
  }

  method eliminate(){
    musica.sonido_pause()
    game.removeVisual(self)
  }

  method impactado() {
    self.eliminate() //no debería ir acá, pero es donde mejor anda
    sincronizadorDePantallas.cambiarPantalla("perdedor") 
//console.println("entraste aca")
    new MenuPerdiste().cargar()
  }

  method atacarDerecha() = new AtaqueDerecho().energia(self.position(), datosJugador.imagen_atacando_derecha(), 1)
  method atacarIzquierda() = new AtaqueIzquierdo().energia(self.position(), datosJugador.imagen_atacando_izquierda(), -1)
}

object atajos{
  method jugador() = game.allVisuals().filter({objeto => objeto.image() == datosJugador.imagen()}).head()
  method enemigo() = game.allVisuals().filter({objeto => objeto.image() == aparienciaEnemigo.valor()}).head()
}

object datosJugador {
  var property imagen = null
  var property imagen_ataque_izquierdo = null
  var property imagen_ataque_derecho = null
  var property imagen_atacando_izquierda = null
  var property imagen_atacando_derecha = null
  var property sonido_ataque = null
}

object gokuAtacando {
  //var property position = null
  const property position = new PosicionVariable()
  var property lado = null
  method image() = lado
  
  method impactado(){
    sincronizadorDePantallas.cambiarPantalla("perdedor") 
  }

  method eliminate(){
    game.removeVisual(self)
  }

}

class AtaqueDerecho{
  var personaje = null
  var property impacto = 0
  const property position = new PosicionVariable(x = 1, y = 1)
  const property sonido = game.sound(datosJugador.sonido_ataque())

  method efectoSonoro() {
    self.sonido().volume(0.2)
    self.sonido().play()
  }
  
  method image() = datosJugador.imagen_ataque_derecho()

  method impactado() {
    atajos.enemigo().herido()
    self.impacto(1)
  }

  method energia(posicion, lado, valor){
    gokuAtacando.lado(lado)
    gokuAtacando.position().establecerPos(posicion.x(), posicion.y())
    position.establecerPos(posicion.x() + valor, posicion.y())
    if(!niveles.mismaPosicion(self.position())){
      self.efectoSonoro()
      game.addVisual(gokuAtacando)
      personaje = atajos.jugador()
      atajos.jugador().eliminate()
      game.addVisual(self)
      game.schedule(500, {self.avanzar()})
    }
  }

  method lugarValido() = niveles.mismaPosicion(game.at(position.x(), position.y()))

  method avanzar(){
    if(!niveles.mismaPosicion(game.at(position.x() + 1, position.y())) && position.x() + 1 < game.width() - 1 && impacto < 1 && sincronizadorDePantallas.pantallaActual() != "perdedor"){
      position.goRight(1)
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
    //console.println("entraste aca")
        new MenuPerdiste().cargar()
      }
      if(sincronizadorDePantallas.pantallaActual() == "ganador"){
        new MenuGanaste().cargar()
      }
    }
  }

  method eliminate(){
    self.sonido().stop()
    game.removeVisual(self)
  }
}

class AtaqueIzquierdo inherits AtaqueDerecho{
  override method image() = datosJugador.imagen_ataque_izquierdo()

  override method avanzar(){
    if(!niveles.mismaPosicion(game.at(position.x() - 1, position.y())) && position.x() - 1 > 0 && impacto < 1 && sincronizadorDePantallas.pantallaActual() != "perdedor"){
      position.goLeft(1)
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
    //console.println("entraste aca")
        new MenuPerdiste().cargar()
        //new MenuGanaste().cargar()
      }
      if(sincronizadorDePantallas.pantallaActual() == "ganador"){
        new MenuGanaste().cargar()
      }
    } 
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

object modificadorMapa inherits MutablePosition{

    var property position = null
    var property estado_accion = ponerBloque

    method modBloques(direccion) {
      game.removeTickEvent("mover-puntero")
      self.position(atajos.jugador().position())
      self.detectarSiguientePosicionValida(direccion)
    }

    method detectarSiguientePosicionValida(direccion){
        self.position(direccion.mover(self.position()))

        if(niveles.mismaPosicion(self.position())) self.estado_accion(quitarBloque)
        self.estado_accion().realizarAccion(self.position())

        game.onTick(100, "mover-puntero", {
          self.position(direccion.mover(self.position()))
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
}

object ponerBloque{
  method realizarAccion(posicion){
    if(!niveles.mismaPosicion(posicion) && posicion.x() >= 1 && posicion.x() <= (game.width()-2) && posicion.y() >= 1 && posicion.y() <= (game.height()-2)){
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