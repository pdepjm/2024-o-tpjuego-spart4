class Bloque{
	var property position = game.center() //habrá que posicionar los limites
	method image() = "bloque_slime.png"
	method soyBloque() = true
    method ubicarYDibujar(x,y){
        self.position(game.at(x,y))
        game.addVisual(self)
    }
}

object muros{
    method crearLaterales(){
        const ancho = game.width() - 1
        const alto = game.height() - 1
        (0 .. ancho).forEach({x => (new Bloque()).ubicarYDibujar(x, 0)}) // Borde inferior
        (0 .. ancho).forEach({x => (new Bloque()).ubicarYDibujar(x, alto)}) // Borde superior
        (0 .. alto).forEach({y => (new Bloque()).ubicarYDibujar(0, y)}) // Borde izquierdo
        (0 .. alto).forEach({y => (new Bloque()).ubicarYDibujar(ancho, y)}) // Borde derecho
    }
}

object escenario{
    var lista = [[2,6], [2,7], [7,7], [7,6], [7,4], [2,4], [4,2], [5,2], [3,3], [6,3]]
    method generarEscenario(){
        (0 .. 9).forEach({x => self.dibujar(x)}) 
    }
    method dibujar(x){
        const listaAux = lista.get(x)
        const j = listaAux.get(0)
        const z = listaAux.get(1)
        new Bloque().ubicarYDibujar(j, z)
    }
}