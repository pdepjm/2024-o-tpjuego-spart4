import mainExample.*

import wollok.game.*

import jugador.*

import muros.*

import puntos.*

import miscelaneos.*

class Menus{
	const add_1
	const add_2
	const moverA
	const cantidadDeIncrementoParaPosiciones
	const equisMax
	const equisMin
	const yeMax
	const yeMin
	const tipoDeMenu

	method cargar(){
		game.addVisual(add_1)
		game.addVisual(add_2)	  
	  if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
		keyboard.w().onPressDo({if(moverA.position().y() < yeMax) moverA.position(game.at(moverA.position().x(), moverA.position().y() + cantidadDeIncrementoParaPosiciones))})
	  	keyboard.a().onPressDo({if(moverA.position().x() > equisMin) moverA.position(game.at(moverA.position().x() - cantidadDeIncrementoParaPosiciones, moverA.position().y()))})
	  	keyboard.s().onPressDo({if(moverA.position().y() > yeMin) moverA.position(game.at(moverA.position().x(), moverA.position().y() - cantidadDeIncrementoParaPosiciones))})
	  	keyboard.d().onPressDo({if(moverA.position().x() < equisMax) moverA.position(game.at(moverA.position().x() + cantidadDeIncrementoParaPosiciones, moverA.position().y()))})}
	  //keyboard.enter().onPressDo({})
	}
}


object menuPersonaje inherits Menus(add_1 = menuPersonajes, add_2 = marcoDeSeleccion, moverA = marcoDeSeleccion, cantidadDeIncrementoParaPosiciones = 5, equisMax = 12, equisMin = 2, yeMax = 5, yeMin = 5, tipoDeMenu = "personajes"){
	override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
				sincronizadorDePantallas.cambiarPantalla("niveles")
				jugador.valor(marcoDeSeleccion.position().x())
				game.removeVisual(menuPersonajes)
				game.removeVisual(marcoDeSeleccion)
				menuNivel.cargar()
			}
		})
	}
}

object menuNivel inherits Menus(add_1 = menuNiveles, add_2 = seleccionNivel, moverA = seleccionNivel, cantidadDeIncrementoParaPosiciones = 2, equisMax = 14, equisMin = 1, yeMax = 11, yeMin = 3, tipoDeMenu = "niveles"){
	method bloquear(){ //DIBUJAR MENSAJE DE "NIVEL NO DESBLOQUEADO"
			if(bloqueados.any({bloqueado => bloqueado == seleccionNivel.position()})){
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
				if(seleccionNivel.position() == game.at(1,11)){ //Seleccionado nivel 1
				escenario.generarLista(0)
				} else if(seleccionNivel.position() == game.at(3,11)){ //Seleccionado nivel 2
				escenario.generarLista(1)
				}
				game.removeVisual(menuNiveles)
				game.removeVisual(seleccionNivel)
				points.reset()
				juego.jugar()
			}
		})
	}
}

object menuGanaste inherits Menus(add_1 = ganaste, add_2 = seleccionGanaste, moverA = seleccionGanaste, cantidadDeIncrementoParaPosiciones = 4, equisMax = 10, equisMin = 6, yeMax = 5, yeMin = 5, tipoDeMenu = "ganador"){
	override method cargar(){
		super()
        game.removeVisual(jugador)
		game.removeVisual(marcadorLeft)
		game.removeVisual(points)
		game.removeVisual(marcadorRight)
		escenario.limpiarEscenario()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				game.removeVisual(seleccionGanaste)
				game.removeVisual(ganaste)
				if (seleccionGanaste.position() == game.at(6, 5)) {
					sincronizadorDePantallas.cambiarPantalla("niveles")
					menuNivel.cargar()
				}
				if (seleccionGanaste.position() == game.at(10, 5)){ 
					game.addVisual(finDelJuego)
					game.stop()
				}
			}
		})
	}
}

object juego{

	method jugar(){ //DIBUJO DE LOS ELEMENTOS DEL MUNDO
		//dibujar muros
		muros.crearLaterales()
		//dibujar escenario
		escenario.generarEscenario()
		//dibujar frutas
		spawn.dibujarFrutas()
		//dibujar puntos
		game.addVisual(marcadorLeft)
		game.addVisual(points)
		game.addVisual(marcadorRight)
		//dibujar jugador
		jugador.posicionate()
		//game.addVisualCharacter(jugador)
		game.showAttributes(jugador)
	}
}

object sincronizadorDePantallas{
	var pantalla = "personajes"
	method cambiarPantalla(nuevaPantalla){
	  pantalla = nuevaPantalla
	}
	method pantallaActual() = pantalla
}
