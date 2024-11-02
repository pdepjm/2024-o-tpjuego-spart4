import wollok.game.*
import muros.*
import enemigos.*
import miscelaneos.*
import puntos.*
import jugador.*

mixin Generacion_nivel{
    var property apariencia_enemigo = "piog"
    var property velocidad_de_enemigos = 500

    var property fondo = fondoJuego
    var property apariencia_bloque = "b_pas.png"

    var property mapa = 2

    const lista_de_enemigos = []

     method generarEscenario() {

        game.addVisual(fondo)

        spawn.dibujarFrutas()
		muros.crearBordeSuperior()
		muros.crearLaterales()

        var ys = game.height() - 2
        var xs = game.width() - 2

        mapa.forEach{fila => 
            fila.forEach{espacio =>
                if(espacio == 1){
                    const bloque = new Bloque_mapa(position = game.at(xs, ys), apariencia = apariencia_bloque)
                    game.addVisual(bloque)
                }
                else if(espacio == 2){
                    const enemigo = new Enemigo1(vida = 10, position = game.at(xs, ys), apariencia = apariencia_enemigo)
                    lista_de_enemigos.add(enemigo)
                }
                xs = xs - 1
            }
            xs = game.width() - 2
            ys = ys - 1
        }

        const jugador = new Jugador()
		jugador.valor(datosJugador.imagen())
		jugador.posicionate()
		muros.crearBordeInferior()
        self.activar_enemigos()
        game.showAttributes(jugador)
    }

    method activar_enemigos() {
      lista_de_enemigos.forEach({enemigo => enemigo.activar_enemigo()})
    }
}

object nivel_1 inherits Generacion_nivel {
    const mapa_1 = [
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
        [0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
        [0,1,0,1,1,1,0,0,0,1,1,1,0,0,1,0],
        [0,1,0,1,0,1,0,0,0,1,0,1,0,0,1,0],
        [0,1,0,1,0,1,0,0,0,1,0,1,0,0,1,0],
        [0,1,0,1,1,1,0,2,0,1,1,1,0,0,1,0],
        [0,1,0,0,0,0,0,0,0,0,0,0,0,2,1,0],
        [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
        [0,1,0,0,0,0,2,0,0,0,0,0,0,0,0,0],
        [0,1,0,1,1,1,0,0,0,1,1,1,0,0,1,0],
        [0,1,0,1,0,1,0,0,1,1,0,1,0,0,1,0],
        [0,1,0,1,0,1,0,0,0,1,0,1,0,0,1,0],
        [0,1,0,1,1,1,0,0,0,1,1,1,0,0,1,0],
        [0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
    ]

    method iniciar_mapa(){
        self.mapa(mapa_1)
        self.apariencia_enemigo("piopio.png")
        self.apariencia_bloque("b_pasto.png")
        self.fondo(fondoJuego)

        self.generarEscenario()
    }

}


object nivel_2 inherits Generacion_nivel {
    const mapa_2 = [
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,0,0,0,0,0,0,0,0,0,0,0,2,1,0],
    [0,1,0,1,1,1,0,1,0,1,1,1,0,0,1,0],
    [0,1,0,1,0,1,1,0,1,1,0,1,0,0,1,0],
    [0,1,0,0,0,0,1,0,0,1,0,1,0,0,1,0],
    [0,1,1,1,1,0,1,1,1,1,1,1,0,0,1,0],
    [0,1,0,0,0,0,0,0,0,0,0,0,0,2,1,0],
    [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
    [0,1,0,0,0,1,0,1,0,0,0,0,1,0,1,0],
    [0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,0],
    [0,1,0,1,0,1,0,2,0,1,0,1,0,0,1,0],
    [0,1,0,1,0,1,1,1,0,1,0,1,0,1,1,0],
    [0,1,0,1,1,1,0,0,0,1,1,1,0,0,1,0],
    [0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
]


    method iniciar_mapa(){
        self.mapa(mapa_2)
        self.apariencia_enemigo("piopio.png")
        self.apariencia_bloque("b_pasto.png")
        self.fondo(fondoJuego)

        self.generarEscenario()
    }

}

object nivel_testing inherits Generacion_nivel {
    const mapa_t = [
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
        [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
        [0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,0],
        [0,1,0,1,0,1,0,0,0,1,0,1,0,1,1,0],
        [0,1,0,1,0,1,0,0,0,1,0,1,0,1,1,0],
        [0,1,0,1,1,1,0,2,0,1,1,1,0,1,1,0],
        [0,1,0,0,0,0,0,0,0,0,0,0,0,2,1,0],
        [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
        [0,1,0,0,0,0,2,0,0,0,0,0,0,1,0,0],
        [0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,0],
        [0,1,0,1,0,1,0,0,1,1,0,1,0,1,1,0],
        [0,1,0,1,0,1,0,0,0,1,0,1,0,1,1,0],
        [0,1,0,1,1,1,0,0,0,1,1,1,0,1,1,0],
        [0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1]
]


    method iniciar_mapa(){
        self.mapa(mapa_t)
        self.apariencia_enemigo("piopio.png")
        self.apariencia_bloque("b_pasto.png")
        self.fondo(fondoJuego)

        self.generarEscenario()
    }

}