import miscelaneos.*

class Enemigo1 inherits ObjetoVisible{
    //var lado = 0
    var property vida
    var property position = game.center()
    var property velocidad = 700 
    var property apariencia = "piopio.png" 
    method image() = apariencia
    override method esEnemigo() = true 

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
        game.onCollideDo(self, {elemento => 
          if(elemento.soyBloque()){
            self.volver()
            self.cambiar_vector_movimiento() 
          }
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
    var property enemigo = new Enemigo1(vida = 100)

    method imagen(imagen){
        enemigo.apariencia(imagen)
    }
    method activar(){
        enemigo.activar_enemigo()
    }
}

/*
import movimiento.*

class Enemigos inherits FiguraConMovimiento(position = game.at(1,2)){
    //var property position = game.at(4,16)
    const tiempo
    var lado = 0
    method image() = "piopio.png"

    method moverseH(){
        game.onTick(tiempo, self, {self.position(game.at(self.position().x().randomUpTo(self.position().x()+1), self.position().y().randomUpTo(self.position().y()+1)))})
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }

}

object lineaEnemiga{
    var property enemigo1 = new Enemigos(tiempo = 500)

    method activar(){
        game.addVisual(enemigo1)
        enemigo1.moverseH()
    }
}
*/