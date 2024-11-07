import jugador.*
import menus.*


class Enemigo1{
    var property position = game.at(4,16)
    //const position = new MutablePosition()
    var lado = 0
    var property vida
    method image() = "cell1.png"

    method moverseH(limite1, limite2){
        game.onTick(500, self, {self.muevete(limite1, limite2)})
    }

    method muevete(limite1, limite2){
        if(self.position().x() == limite2){
            lado = 1
        }
        if(self.position().x() == limite1){
            lado = 0
        }
        if(lado == 0 && self.position().x()<limite2){
            position = game.at(self.position().x()+1, 16)
        }
        if(lado == 1 && self.position().x()>limite1){
            position = game.at(self.position().x()-1, 16)
        }
    }

    method herido() {
      vida -= 50
      if(vida == 0){
        self.morir()
      }
    }

    method morir(){
        sincronizadorDePantallas.cambiarPantalla("ganador")
        //new MenuGanaste().cargar()
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }

}

object lineaEnemiga{
    var property enemigo = new Enemigo1(vida = 150)

    method activar(){
        game.addVisual(enemigo)
        enemigo.moverseH(4,13)
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