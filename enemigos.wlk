import wollok.game.*


class Enemigo1{
    var property position = game.at(7,16)
    //var lado = 0
    method image() = "piopio.png"

    var property vector_movimiento = [0, 1, 0, 0] 

    method movimiento(){
        game.onTick(700, "mover_automaticamente", {self.moverse()})
    }

    method detener() {
        game.removeTickEvent("mover_automaticamente")
    }

    method cambiar_vector_movimiento() {
      const primer_elemento = vector_movimiento.take(1)
      vector_movimiento.remove(vector_movimiento.get(0))
      vector_movimiento.addAll(primer_elemento)
      self.movimiento()
    }

    method detectar_colisiones() {
        game.onCollideDo(self, {elemento => 
            self.detener()
            self.volver()
            self.cambiar_vector_movimiento() 
        })
    }

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
    var property enemigo = new Enemigo1()

    method activar(){
        game.addVisual(enemigo)
        enemigo.moverseH(4,13)
    }
}