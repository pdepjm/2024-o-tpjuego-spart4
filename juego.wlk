import musica.*
import jugador.*
import muros.*
import enemigos.*
import puntos.*
import miscelaneos.*
import niveles.*

object juego{
//DIBUJO DE LOS ELEMENTOS DEL MUNDO    
	method jugar(){ 
        points.reset()
		//dibujar fondo
		game.addVisual(fondoJuego)
		//dibujar muros
		niveles.generarEscenario()
		//dibujar enemigo
//lineaEnemiga.activar()
		const jugador = new Jugador(valor = datosJugador.imagen())
		//dibujar jugador
		jugador.posicionate()
		game.showAttributes(jugador)
		//dibujar frutas
		spawn.dibujarPuntos(1)
		//dibujar superior
		niveles.generarBloquesSuperiores()
		//dibujar puntos
		game.addVisual(points)
		//Activar el movimiento del enemigo 
		const enemigo = new Enemigo1(vida = 150)
		enemigo.aparecer()
		enemigo.caminar()
		game.onCollideDo(atajos.enemigo(), {elemento => elemento.impactado()})
		//niveles.activarEnemigos()
		//reproducir la musica correspondiente
		//musicaDeFondo.play()
		musica.sonido_continue()
	}

//BORRAR ELEMENTOS DEL JUEGO
    method limpiar(){
        //game.removeVisual(atajos.jugador())
		//lineaEnemiga.enemigo().limpiarEnemigos()
		atajos.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		niveles.limpiarEscenario()
		//musicaDeFondo.stop()
    }

    method cargarVisuales(posicion){
        datosJugador.imagen(coleccion.personaje(posicion))
		datosJugador.imagen_ataque_izquierdo(coleccion.ataque_i(posicion))
		datosJugador.imagen_ataque_derecho(coleccion.ataque_d(posicion))
		datosJugador.imagen_atacando_izquierda(coleccion.animacion_i(posicion))
		datosJugador.imagen_atacando_derecha(coleccion.animacion_d(posicion))
		// lineaEnemiga.imagen(coleccion.enemigo(posicion))
		aparienciaEnemigo.valor(coleccion.enemigo(posicion))
		fondoJuego.valor(coleccion.fondo(posicion))
        visual.valor(coleccion.bloque_i(posicion))
		visualSuperior.valor(coleccion.bloque_s(posicion))
		spawn.puntos(coleccion.puntos(posicion))
					//musicaDeFondo.sonido(game.sound(coleccion.musica(posicion)))
    }
	method cargarSonido(posicion){
	  datosJugador.sonido_ataque(coleccion.sonido(posicion))
	}
}