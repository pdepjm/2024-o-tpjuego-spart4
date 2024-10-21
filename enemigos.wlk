class Enemigo1{
    var property position = game.at(4,16)
    var lado = 0
    method image() = "piopio.png"

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