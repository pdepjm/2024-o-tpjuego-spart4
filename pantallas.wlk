
/*method bloquear(){ //DIBUJAR MENSAJE DE "NIVEL NO DESBLOQUEADO"
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
						game.at(15,3),game.at(15,5),game.at(15,7),game.at(15,9),game.at(15,11)]*/
import miscelaneos.*
import muros.*
import jugador.*
import puntos.*
import enemigos.*

const prota = new Jugador()
const p_personajes = new PantallaPersonajes()
const p_niveles = new PantallaNiveles()
const p_ganaste = new PantallaGanaste()
const p_perdiste = new PantallaPerdiste()


class Pantalla{
    const pantalla
    const selector

    method posicionX() = selector.position().x()
    method posicionY() = selector.position().y()

    method modificarXY(valor){
        selector.position(valor)
    }

    method cargar(){
        game.addVisual(pantalla)
        game.addVisual(selector)
    }
    method borrar(){
        game.removeVisual(pantalla)
        game.removeVisual(selector)
    }
}

class PantallaPersonajes inherits Pantalla(pantalla = menuPersonajes, selector = marcoDeSeleccion){
}
class PantallaNiveles inherits Pantalla(pantalla = menuNiveles, selector = seleccionNivel){
}


class PantallaGanaste inherits Pantalla(pantalla = ganaste, selector = seleccionGanaste){
    override method cargar(){
        super()
        game.removeVisual(prota)
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		escenario.limpiarEscenario()
    }
}

class PantallaPerdiste inherits Pantalla(pantalla = perdiste, selector = seleccionGanaste){
    override method cargar(){
        super()
        game.removeVisual(prota)
		lineaEnemiga.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		escenario.limpiarEscenario()
    }
}

object juego{
	method jugar(){ //DIBUJO DE LOS ELEMENTOS DEL MUNDO
		//dibujar fondo
		game.addVisual(fondoJuego)
		//dibujar frutas
		spawn.dibujarPuntos(1)
		//dibujar muros
		muros.crearBordeSuperior()
		muros.crearLaterales()
		//?
		lineaEnemiga.activar()
		//dibujar escenario
		escenario.generarEscenario()
		//dibujar jugador
		prota.posicionate()
		//game.addVisualCharacter(jugador)
		muros.crearBordeInferior()
		//dibujar puntos
		//game.addVisual(marcadorLeft)
		game.addVisual(points)
		//game.addVisual(marcadorRight)
		game.showAttributes(prota)
	}
}