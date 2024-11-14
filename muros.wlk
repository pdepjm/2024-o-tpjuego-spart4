import niveles.*
import miscelaneos.*

class Bloque{
	var property position = game.center()
	method image() = visual.valor()
    method ubicarYDibujar(x,y){
        self.position(game.at(x,y))
        game.addVisual(self)
        niveles.enlistarBloque(self)
    }
    method quitarBloque() {
        game.removeVisual(self)
        niveles.sacarBloqueDeLista(self)
    }
    method impactado(){}

    // override method soyBloque() = true 
}
class BloqueSuperior {
	var property position = game.center()
	method image() = visualSuperior.valor()
    method ubicarYDibujar(x,y){
        self.position(game.at(x,y))
        game.addVisual(self)
    }
    method quitarBloque() = game.removeVisual(self)

    // override method esBloqueSuperior() = true
}

object visual{
    var property valor = "b_fiesta_i.png"
}
object visualSuperior{
    var property valor = "b_fiesta_sup.png"
}