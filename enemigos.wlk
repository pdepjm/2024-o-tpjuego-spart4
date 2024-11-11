import miscelaneos.*
import muros.*

class Enemigo1{
    //var lado = 0
    var property vida
    var property position = game.center()
    var property velocidad = 300 
    var property apariencia = "piopio.png" 
    method image() = apariencia
    // override method esEnemigo() = true 

    // [left, down, right, up]
    var property vector_movimiento = [0, 1, 0, 0] 

    method movimiento(){
        game.onTick(velocidad, self, {self.moverse()})
    }

    method cambiar_vector_movimiento() {
      const elemento = vector_movimiento.get(0)
      vector_movimiento.remove(vector_movimiento.get(0))
      vector_movimiento.addAll([elemento])
    }

    method detectar_colisiones() {
       /*  game.onCollideDo(self, {elemento => 
          if(elemento.soyBloque()){
            self.volver()
            self.cambiar_vector_movimiento() 
          }
        }) */
    }

    method retroceder(){}

    method volver() {
         position = position.left(vector_movimiento.get(0) * -1)
                    .down(vector_movimiento.get(1) * -1)
                    .right(vector_movimiento.get(2) * -1)
                    .up(vector_movimiento.get(3) * -1)
    }

    method moverse(){
        position = position.left(vector_movimiento.get(0))
                    .down(vector_movimiento.get(1))
                    .right(vector_movimiento.get(2))
                    .up(vector_movimiento.get(3))
    }

    method activar_enemigo() {
      game.addVisual(self)
	    self.movimiento()
	    self.detectar_colisiones()
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }
}

object lineaEnemiga{
   var property enemigo = new Enemigo1(vida = 100)

    method imagen(imagen){
        //enemigo.apariencia(imagen)
    }
    method activar(){
        // enemigo.activar_enemigo()
    }
}