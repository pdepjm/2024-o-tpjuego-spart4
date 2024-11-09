import mainExample.*
import muros.*
import miscelaneos.*
import juego.*

class Menus{
	const add_1
	const add_2
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
		keyboard.w().onPressDo({if(add_2.position().y() < yeMax) add_2.position(game.at(add_2.position().x(), add_2.position().y() + cantidadDeIncrementoParaPosiciones))})
	  	keyboard.a().onPressDo({if(add_2.position().x() > equisMin) add_2.position(game.at(add_2.position().x() - cantidadDeIncrementoParaPosiciones, add_2.position().y()))})
	  	keyboard.s().onPressDo({if(add_2.position().y() > yeMin) add_2.position(game.at(add_2.position().x(), add_2.position().y() - cantidadDeIncrementoParaPosiciones))})
	  	keyboard.d().onPressDo({if(add_2.position().x() < equisMax) add_2.position(game.at(add_2.position().x() + cantidadDeIncrementoParaPosiciones, add_2.position().y()))})}
	  //keyboard.enter().onPressDo({})
	}

	method limpiarPantalla(){
		game.removeVisual(add_1)
		game.removeVisual(add_2)
	}
}


object menuPersonaje inherits Menus(add_1 = menuPersonajes, add_2 = marcoDeSeleccion, cantidadDeIncrementoParaPosiciones = 5, equisMax = 12, equisMin = 2, yeMax = 5, yeMin = 5, tipoDeMenu = "personajes"){
	override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){
				sincronizadorDePantallas.cambiarPantalla("niveles")
				//valores visuales
				const posicion = (add_2.position().x()-2)/5
				juego.cargarVisuales(posicion)
				//remove
				self.limpiarPantalla()
				menuNivel.cargar()
			}
		})
	}
}

object menuNivel inherits Menus(add_1 = menuNiveles, add_2 = seleccionNivel, cantidadDeIncrementoParaPosiciones = 2, equisMax = 3, equisMin = 1, yeMax = 11, yeMin = 11, tipoDeMenu = "niveles"){
    override method cargar(){
		super()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				sincronizadorDePantallas.cambiarPantalla("jugar")
				const nivel = (add_2.position().x()-1)/2
				escenarioNivel.nivel(nivel)
				self.limpiarPantalla()
				juego.jugar()
			}
		})
	}
}

object menuGanaste inherits Menus(add_1 = ganaste, add_2 = seleccionGanaste, cantidadDeIncrementoParaPosiciones = 4, equisMax = 10, equisMin = 6, yeMax = 5, yeMin = 5, tipoDeMenu = "ganador"){
	override method cargar(){
		super()
        juego.limpiar()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				self.limpiarPantalla()
				if (add_2.position() == game.at(6, 5)) {
					sincronizadorDePantallas.cambiarPantalla("niveles")
					menuNivel.cargar()
				}
				if (add_2.position() == game.at(10, 5)){ 
					game.addVisual(finDelJuego)
					game.stop()
				}
			}
		})
	}
}
object menuPerdiste inherits Menus(add_1 = perdiste, add_2 = seleccionPerdiste, cantidadDeIncrementoParaPosiciones = 2, equisMax = 5, equisMin = 5, yeMax = 10, yeMin = 5, tipoDeMenu = "perdedor"){
	override method cargar(){
		super()
        juego.limpiar()
		keyboard.enter().onPressDo({
			if(sincronizadorDePantallas.pantallaActual() == tipoDeMenu){	
				self.limpiarPantalla()
				if (add_2.position() == game.at(5, 7)) {
					sincronizadorDePantallas.cambiarPantalla("jugar")
					juego.jugar()
				}
				if (add_2.position() == game.at(5, 5)){ 
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
}