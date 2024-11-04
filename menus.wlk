import mainExample.*

import wollok.game.*

import jugador.*

import muros.*

import enemigos.*

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
				if(marcoDeSeleccion.position().x() == 7){ //elementos del pajarito
					jugador.valor("p_piopio.png")
					lineaEnemiga.imagen("e_elusive.png")
					fondoJuego.valor("f_pio.png")
					visual.valor("b_pio.png")
					spawn.puntos(["archaic coin.png", "circus coin.png", "lunaver coin.png"])
				} else if(marcoDeSeleccion.position().x() == 12){ //elementos de Goku
					jugador.valor("p_goku.png")
					lineaEnemiga.imagen("e_cell.png")
					fondoJuego.valor("f_pasto.png")
					visual.valor("b_pasto.png")
					spawn.puntos(["semilla.png", "capsula.png", "comida.png"])
				}
				game.removeVisual(menuPersonajes)
				game.removeVisual(marcoDeSeleccion)
				menuNivel.cargar()
			}
		})
	}
}

object menuNivel inherits Menus(add_1 = menuNiveles, add_2 = seleccionNivel, moverA = seleccionNivel, cantidadDeIncrementoParaPosiciones = 2, equisMax = 14, equisMin = 1, yeMax = 11, yeMin = 3, tipoDeMenu = "niveles"){
    override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				sincronizadorDePantallas.cambiarPantalla("jugar")
				if(seleccionNivel.position() == game.at(1,11)){ //Seleccionado nivel 1
				escenario.nivel(1)
				} else if(seleccionNivel.position() == game.at(3,11)){ //Seleccionado nivel 2
				escenario.nivel(2)
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
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
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
object menuPerdiste inherits Menus(add_1 = perdiste, add_2 = seleccionPerdiste, moverA = seleccionGanaste, cantidadDeIncrementoParaPosiciones = 2, equisMax = 5, equisMin = 5, yeMax = 10, yeMin = 5, tipoDeMenu = "perdedor"){
	override method cargar(){
		super()
        game.removeVisual(jugador)
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		escenario.limpiarEscenario()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				game.removeVisual(seleccionGanaste)
				game.removeVisual(perdiste)
				if (seleccionGanaste.position() == game.at(5, 7)) {
					sincronizadorDePantallas.cambiarPantalla("jugar")
					juego.jugar()
				}
				if (seleccionGanaste.position() == game.at(5, 5)){ 
					game.addVisual(finDelJuego)
					game.stop()
				}
			}
		})
	}
}

object juego{

	method jugar(){ //DIBUJO DE LOS ELEMENTOS DEL MUNDO
		//dibujar fondo
		game.addVisual(fondoJuego)
		//dibujar lateral superior
		escenario.generarLateralSuperior()
		//dibujar muros
		escenario.generarEscenario()
		//dibujar enemigo
		lineaEnemiga.activar()
		//dibujar jugador
		jugador.posicionate()
		game.showAttributes(jugador)
		//dibujar lateral inferior
		escenario.generarLateralInferior()
		//dibujar frutas
		spawn.dibujarPuntos(1)
		//dibujar puntos
		game.addVisual(points)
	}
}

object sincronizadorDePantallas{
	var pantalla = "personajes"
	method cambiarPantalla(nuevaPantalla){
	  pantalla = nuevaPantalla
	}
	method pantallaActual() = pantalla
}