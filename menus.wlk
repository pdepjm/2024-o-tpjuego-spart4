import niveles.*
import mainExample.*

import wollok.game.*

import jugador.*

import juego.*

import musica.*

import muros.*

import enemigos.*

import puntos.*

import miscelaneos.*

class Menus{
	const add
	const moverA
	const cantidadDeIncrementoParaPosiciones
	const equisMax
	const equisMin
	const yeMax
	const yeMin
	const tipoDeMenu

	method cargar(){
		game.addVisual(add)
		//game.addVisual(add_2)	
		game.addVisual(moverA)  
	  if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
		keyboard.w().onPressDo({if(moverA.position().y() < yeMax) moverA.position(game.at(moverA.position().x(), moverA.position().y() + cantidadDeIncrementoParaPosiciones))})
	  	keyboard.a().onPressDo({if(moverA.position().x() > equisMin) moverA.position(game.at(moverA.position().x() - cantidadDeIncrementoParaPosiciones, moverA.position().y()))})
	  	keyboard.s().onPressDo({if(moverA.position().y() > yeMin) moverA.position(game.at(moverA.position().x(), moverA.position().y() - cantidadDeIncrementoParaPosiciones))})
	  	keyboard.d().onPressDo({if(moverA.position().x() < equisMax) moverA.position(game.at(moverA.position().x() + cantidadDeIncrementoParaPosiciones, moverA.position().y()))})
		}
	  //keyboard.enter().onPressDo({})
	}

	method limpiarPantalla(){
		game.removeVisual(add)
		game.removeVisual(moverA)
	}
}


class MenuPersonaje inherits Menus(add = menuPersonajes, moverA = marcoDeSeleccion, cantidadDeIncrementoParaPosiciones = 5, equisMax = 12, equisMin = 2, yeMax = 5, yeMin = 5, tipoDeMenu = "personajes"){
	override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
				sincronizadorDePantallas.cambiarPantalla("niveles")
				//valores visuales
				const posicion = (moverA.position().x()-2)/5
				juego.cargarVisuales(posicion)
				juego.cargarSonido(posicion)
				musica.cancion(game.sound(coleccion.musica(posicion)))
				//remove
				self.limpiarPantalla()
				musica.sonido_on()
				musica.sonido_pause()
				const menuNivel = new MenuNivel()
				menuNivel.cargar()
			}
		})
	}
}

class MenuNivel inherits Menus(add = menuNiveles, moverA = new SeleccionNivel(), cantidadDeIncrementoParaPosiciones = 2, equisMax = 3, equisMin = 1, yeMax = 11, yeMin = 11, tipoDeMenu = "niveles"){

    override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				sincronizadorDePantallas.cambiarPantalla("jugar")
				const nivel = (moverA.position().x()-1)/2
				niveles.nivel(nivel)
				self.limpiarPantalla()
				juego.jugar()
			}
		})
	}
}

class MenuGanaste inherits Menus(add = ganaste, moverA = new SeleccionGanaste(), cantidadDeIncrementoParaPosiciones = 4, equisMax = 10, equisMin = 6, yeMax = 5, yeMin = 5, tipoDeMenu = "ganador"){
	override method cargar(){
		super()
        //game.removeVisual(jugador)
		//atajos.jugador().eliminate()
		juego.limpiar()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				self.limpiarPantalla()
				if (moverA.position() == game.at(6, 5)) {
					sincronizadorDePantallas.cambiarPantalla("niveles")
					new MenuNivel().cargar()
				}
				if (moverA.position() == game.at(10, 5)){ 
					game.addVisual(finDelJuego)
					game.stop()
				}
			}
		})
	}
}
class MenuPerdiste inherits Menus(add = perdiste, moverA = new SeleccionPerdiste(), cantidadDeIncrementoParaPosiciones = 2, equisMax = 5, equisMin = 5, yeMax = 7, yeMin = 5, tipoDeMenu = "perdedor"){
	override method cargar(){
		super()
        juego.limpiar()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				self.limpiarPantalla()
				if (moverA.position() == game.at(5, 7)) {
					//points.reset()
		//console.println("seleccionaste jugar")
					sincronizadorDePantallas.cambiarPantalla("jugar")
					juego.jugar()
					//sincronizadorDePantallas.cambiarPantalla("niveles")
					//new MenuNivel().cargar()
				}
				if (moverA.position() == game.at(5, 5)){ 
					game.addVisual(finDelJuego)
					game.stop()
				}
			}
		})
	}
}

object sincronizadorDePantallas{
	var pantalla = "personajes"
	method cambiarPantalla(nuevaPantalla){
	  pantalla = nuevaPantalla
	}
	method pantallaActual() = pantalla

	method habilitar() = pantalla == "jugar"
}

object laMuerte {
  method erradicar() = game.removeVisual(game.getObjectsIn(game.at(1, 1)))
}