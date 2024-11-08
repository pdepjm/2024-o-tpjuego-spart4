//IMAGENES DE PANTALLAS
object ganaste{
    var property position = game.origin()
    method image() = "PP_victoria.png"
}
object perdiste{
    var property position = game.origin()
    method image() = "PP_derrota.png"
}
object menuPersonajes{
    var property position = game.origin()
    method image() = "PP_personajes.png"
}
object menuNiveles{
    var property position = game.origin()
    method image() = "PP_niveles_2.png"
}
object finDelJuego{
    var property position = game.origin()
    method image() = "PP_final.png"
}

mixin ObjetoVisible {
  method soyBloque() = false
  method esPunto() = false
  method jugador() = false   
  method esEnemigo() = false 
  method esFondo() = false
  method esBloqueSuperior() = false
}

object moverAbajo{
    method vector() = [0, 1, 0, 0]
}

object moverArriba{
    method vector() = [0, 0, 0, 1]
}

object moverDerecha{
    method vector() = [0, 0, 1, 0]
}

object moverIzquierda{
    method vector() = [1, 0, 0, 0]
}

//IMAGENES DE SELECCION
object marcoDeSeleccion{
    var property position = game.at(2,5)
    method image() = "S_personajes.png"
}
object seleccionNivel{
    var property position = game.at(1, 11)
    method image() = "S_niveles.png"
}
object seleccionGanaste{
    var property position = game.at(6, 5)
    method image() = "S_niveles.png"
}
object seleccionPerdiste{
    var property position = game.at(5, 5)
    method image() = "S_derrota.png"
}

//BACKGROUND
object fondoJuego inherits ObjetoVisible{
    var property position = game.origin()
    var property valor = "f_slime.png"
    method image() = valor
    override method esFondo() = true 
}

//IMAGENES RELACIONADA A LOS PERSONAJES
object coleccion{
    const c_personajes = ["p_helado.png", "p_piopio.png", "p_goku.png"]
    const c_animaciones_d = ["ataque_d_helado.png", "ataque_d_piopio.png", "ataque_d_goku.png"]
    const c_animaciones_i = ["ataque_i_helado.png", "ataque_i_piopio.png","ataque_i_goku.png"]
    const c_ataques_d = ["a_d_helados.png","a_d_granada.png","a_d_kame.png"]
    const c_ataques_i = ["a_i_helados.png","a_i_granada.png","a_i_kame.png"]
    const c_enemigos = ["e_brocoli.png", "e_elusive.png", "e_cell.png"]
    const c_bloques = ["b_fiesta_i.png","b_pio_i.png","b_pasto_i.png"]
    const c_bloques_sup = ["b_fiesta_sup.png","b_pio_sup.png","b_pasto_sup.png"]
    const c_fondos = ["f_slime.png","f_pio.png","f_pasto.png"]
    const c_puntos = [["pu_bananas.png","pu_uva.png","pu_sandia.png"],
                      ["pu_archaic coin.png","pu_circus coin.png","pu_lunaver coin.png"],
                      ["pu_semilla.png","pu_capsula.png","pu_comida.png"]]
    const c_musica = ["BadIceCreamMusicaDeFondo.mp3", "BadIceCreamMusicaDeFondo.mp3", "musicaDragonBallZ.mp3"]

    method personaje(indice) = c_personajes.get(indice)
    method animacion_d(indice) = c_animaciones_d.get(indice)
    method animacion_i(indice) = c_animaciones_i.get(indice)
    method ataque_d(indice) = c_ataques_d.get(indice)
    method ataque_i(indice) = c_ataques_i.get(indice)
    method enemigo(indice) = c_enemigos.get(indice)
    method bloque_i(indice) = c_bloques.get(indice)
    method bloque_s(indice) = c_bloques_sup.get(indice)
    method fondo(indice) = c_fondos.get(indice)
    method puntos(indice) = c_puntos.get(indice)
    method musica(indice) = c_musica.get(indice)
}