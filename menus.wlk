import mainExample.*

import wollok.game.*

import jugador.*

import muros.*

import enemigos.*

import puntos.*

import miscelaneos.*

import niveles.*

class Menus{
	const add_1
	//const add_2
	const property moverA
	const property cantidadDeIncrementoParaPosiciones
	const equisMax
	const equisMin
	const yeMax
	const yeMin
	const tipoDeMenu

	method cargar(){
		game.addVisual(add_1)
		//game.addVisual(add_2)	
		game.addVisual(moverA)  
	  if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
		keyboard.w().onPressDo({if(moverA.position().y() < yeMax) moverA.position(game.at(moverA.position().x(), moverA.position().y() + cantidadDeIncrementoParaPosiciones))})
	  	keyboard.a().onPressDo({if(moverA.position().x() > equisMin) moverA.position(game.at(moverA.position().x() - cantidadDeIncrementoParaPosiciones, moverA.position().y()))})
	  	keyboard.s().onPressDo({if(moverA.position().y() > yeMin) moverA.position(game.at(moverA.position().x(), moverA.position().y() - cantidadDeIncrementoParaPosiciones))})
	  	keyboard.d().onPressDo({if(moverA.position().x() < equisMax) moverA.position(game.at(moverA.position().x() + cantidadDeIncrementoParaPosiciones, moverA.position().y()))})}
	  //keyboard.enter().onPressDo({})
	}
}


class MenuPersonaje inherits Menus(add_1 = menuPersonajes, /* add_2 = marcoDeSeleccion,*/ moverA = marcoDeSeleccion, cantidadDeIncrementoParaPosiciones = 5, equisMax = 12, equisMin = 2, yeMax = 5, yeMin = 5, tipoDeMenu = "personajes"){
	override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
				sincronizadorDePantallas.cambiarPantalla("niveles")
				//jugador.valor(marcoDeSeleccion.position().x())
				if(marcoDeSeleccion.position().x() == 2){ //elementos del helado
					//jugador.valor("helado.png")
					datosJugador.imagen("helado.png")
					fondoJuego.valor("f_slime.png")
					visual.valor("b_fiesta.png")
					spawn.puntos(["bananas.png", "uva.png", "sandia.png"]) //Rompe encapsulamiento?
				} else if(marcoDeSeleccion.position().x() == 7){ //elementos del pajarito
					//jugador.valor("piopio.png")
					datosJugador.imagen("piopio.png")
					fondoJuego.valor("f_pio.png")
					visual.valor("b_pio.png")
					spawn.puntos(["archaic coin.png", "circus coin.png", "lunaver coin.png"])
				} else { //elementos de Goku
					//jugador.valor("goku.png")
					datosJugador.imagen("goku.png")
					fondoJuego.valor("f_pasto.png")
					visual.valor("b_pasto.png")
					spawn.puntos(["semilla.png", "capsula.png", "comida.png"])
				}
				game.removeVisual(menuPersonajes)
				game.removeVisual(marcoDeSeleccion)
				const menuNivel = new MenuNivel()
				menuNivel.cargar()
			}
		})
	}
}

class MenuNivel inherits Menus(add_1 = menuNiveles,/* add_2 = seleccionNivel,*/ moverA = new SeleccionNivel(), cantidadDeIncrementoParaPosiciones = 2, equisMax = 14, equisMin = 1, yeMax = 11, yeMin = 3, tipoDeMenu = "niveles"){
	method bloquear(){ //DIBUJAR MENSAJE DE "NIVEL NO DESBLOQUEADO"
			if(bloqueados.any({bloqueado => bloqueado == moverA.position()})){
				game.addVisual(bloqueado)
			} else {
				game.removeVisual(bloqueado)
			}
	}
	const bloqueados = [game.at(1,3),game.at(1,5),game.at(1,7),game.at(1,9), //lista de niveles a los que no se puede acceder
						game.at(3,3),game.at(3,5),game.at(3,7),game.at(3,9),
						game.at(5,3),game.at(5,5),game.at(5,7),game.at(5,9),game.at(5,11),
						game.at(7,3),game.at(7,5),game.at(7,7),game.at(7,9),game.at(7,11),
						game.at(9,3),game.at(9,5),game.at(9,7),game.at(9,9),game.at(9,11),
						game.at(11,3),game.at(11,5),game.at(11,7),game.at(11,9),game.at(11,11),
						game.at(13,3),game.at(13,5),game.at(13,7),game.at(13,9),game.at(13,11),
						game.at(15,3),game.at(15,5),game.at(15,7),game.at(15,9),game.at(15,11)]

    override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				sincronizadorDePantallas.cambiarPantalla("jugar")
				if(moverA.position() == game.at(1,11)){ //Seleccionado nivel 1
				juego.nivel(nivel_1)
				} else if(moverA.position() == game.at(3,11)){ //Seleccionado nivel 2
				juego.nivel(nivel_testing)
				}
				game.removeVisual(menuNiveles)
				game.removeVisual(moverA)
				points.reset()
				juego.jugar()
			}
		})
	}
}

class MenuGanaste inherits Menus(add_1 = ganaste, /*add_2 = seleccionGanaste,*/ moverA = new SeleccionGanaste(), cantidadDeIncrementoParaPosiciones = 4, equisMax = 10, equisMin = 6, yeMax = 5, yeMin = 5, tipoDeMenu = "ganador"){
	override method cargar(){
		super()
        //game.removeVisual(jugador)
		//game.allVisuals().filter({objeto => objeto.image() == datosJugador.imagen()}).head().eliminate()
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		escenario.limpiarEscenario()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				game.removeVisual(moverA)
				game.removeVisual(ganaste)
				if (moverA.position() == game.at(6, 5)) {
					sincronizadorDePantallas.cambiarPantalla("niveles")
					//const menuNivel = new MenuNivel()
					//menuNivel.cargar()
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
class MenuPerdiste inherits Menus(add_1 = perdiste, /*add_2 = seleccionGanaste,*/ moverA = new SeleccionGanaste(), cantidadDeIncrementoParaPosiciones = 4, equisMax = 10, equisMin = 6, yeMax = 7, yeMin = 7, tipoDeMenu = "perdedor"){
	override method cargar(){
		super()
        //game.removeVisual(jugador)
		//game.allVisuals().filter({objeto => objeto.image() == datosJugador.imagen()}).head().eliminate()
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		escenario.limpiarEscenario()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				game.removeVisual(moverA)
				game.removeVisual(perdiste)
				if (moverA.position() == game.at(6, 5)) {
					sincronizadorDePantallas.cambiarPantalla("jugar")
					juego.jugar()
				}
				if (moverA.position() == game.at(10, 5)){ 
					game.addVisual(finDelJuego)
					game.stop()
				}
			}
		})
	}
}

object juego{

	var property nivel = nivel_1

	method jugar(){ 
		nivel.iniciar_mapa()
		game.addVisual(points)
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