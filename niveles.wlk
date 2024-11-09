import miscelaneos.*
import muros.*

object niveles{
    const nivel1 = [[b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,b,b,b,n,n,n,n,n,n,n,n,b,b,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,b],
                    [b,n,n,b,n,n,n,n,b,b,n,n,n,n,b,n,n,b],
                    [b,n,n,n,b,b,n,n,b,b,n,n,b,b,n,n,n,b],
                    [b,n,n,n,n,n,b,b,n,n,b,b,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]]
                    
    const nivel2 = [[b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,b,b,b,b,b,b,b,b,n,n,n,b],
                    [b,n,n,n,b,b,n,n,n,n,n,n,n,n,b,n,n,b],
                    [b,n,b,b,n,n,n,b,b,b,b,b,b,n,b,n,n,b],
                    [b,n,b,n,n,n,b,n,n,n,n,n,b,n,n,b,n,b],
                    [b,n,b,n,b,b,n,n,b,b,b,n,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,b,n,n,n,b,n,b,n,b,n,b],
                    [b,n,b,n,b,n,b,n,n,b,n,b,n,b,n,b,n,b],
                    [b,n,b,n,b,n,b,b,b,n,n,b,n,b,n,b,n,b],
                    [b,n,b,n,b,n,n,n,n,n,b,n,n,b,n,b,n,b],
                    [b,n,b,n,b,b,b,b,b,b,n,n,b,b,n,b,n,b],
                    [b,n,b,n,n,n,n,n,n,n,n,b,n,n,n,b,n,b],
                    [b,n,n,b,b,b,b,b,b,b,b,n,n,b,b,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,b,b,n,n,n,n,b],
                    [b,n,n,b,b,b,b,b,b,b,b,n,n,n,n,n,n,b],
                    [b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,b],
                    [b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b]]

    method entregarFila(fila, nivel) = if(nivel == 1) nivel1.get(fila) else nivel2.get(fila)
}

object b {
    method decodificar(x,y) 
    {
        escenarioNivel.listaPosiciones().add(game.at(x,y)) 
        new Bloque().ubicarYDibujar(x,y)
    }
    method decodificarSuperior(x,y) = new BloqueSuperior().ubicarYDibujar(x, y)
}

object n {
    method decodificar(x,y) {}
    method decodificarSuperior(x,y){}
}