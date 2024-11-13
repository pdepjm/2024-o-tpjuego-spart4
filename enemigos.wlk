import niveles.*
import miscelaneos.*
import muros.*
import wollok.game.*

class Enemigo1 inherits MutablePosition{
    
    var property vida
    var property velocidad = 200 
    var property position
    method image() = aparienciaEnemigo.valor()
    var property direccion = moverDerecha 

    method movimiento(){
        game.onTick(velocidad, self, {
            self.position(self.direccion().mover(self.position()))
            if(niveles.mismaPosicion(self.position())){
                self.position(self.direccion().retroceder(self.position()))
                self.direccion(cambiarDireccion.rotarDireccion(self.direccion()))
            }
        })
    }

    method activar_enemigo() {
      game.addVisual(self)
	  self.movimiento()
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }
}

object aparienciaEnemigo {
   var property valor = "b_fiesta_i.png"
}

object lineaEnemiga{
    var property enemigo = new Enemigo1(vida = 100, position = game.at(1, 5))

/*     method imagen(imagen){
        enemigo.apariencia(imagen)
    } */
    method activar(){
        enemigo.activar_enemigo()
    }
}