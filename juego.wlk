import musica.*
import jugador.*
import muros.*
import enemigos.*
import puntos.*
import miscelaneos.*

object juego{
//DIBUJO DE LOS ELEMENTOS DEL MUNDO    
	method jugar(){ 
        points.reset()
		//dibujar fondo
		game.addVisual(fondoJuego)
		//dibujar lateral superior
		escenarioNivel.generarLateralSuperior()
		//dibujar muros
		escenarioNivel.generarEscenario()
		//dibujar enemigo
		lineaEnemiga.activar()
		//dibujar jugador
		jugador.posicionate()
		game.showAttributes(jugador)
		//dibujar frutas
		spawn.dibujarPuntos(1)
		//dibujar puntos
		game.addVisual(points)
		//dibujar superior
		escenarioNivel.generarBloquesSuperiores()
		//reproducir la musica correspondiente
		musicaDeFondo.play()
	}

//BORRAR ELEMENTOS DEL JUEGO
    method limpiar(){
        game.removeVisual(jugador)
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		escenarioNivel.limpiarEscenario()
		musicaDeFondo.stop()
    }

    method cargarVisuales(posicion){
        jugador.valor(coleccion.personaje(posicion))
		lineaEnemiga.imagen(coleccion.enemigo(posicion))
		fondoJuego.valor(coleccion.fondo(posicion))
        visual.valor(coleccion.bloque_i(posicion))
		visualSuperior.valor(coleccion.bloque_s(posicion))
		spawn.puntos(coleccion.puntos(posicion))
		musicaDeFondo.sonido(game.sound(coleccion.musica(posicion)))
    }
}