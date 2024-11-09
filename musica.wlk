import muros.*
// const musicaBadIceCream = new MusicaDeFondo(musica = "BadIceCreamMusicaDeFondo.mp3")

// const musicaDragonBallZ = new MusicaDeFondo(musica = "musicaDragonBallZ.mp3")

object musicaDeFondo

{
var property sonido = game.sound("BadIceCreamMusicaDeFondo.mp3")


method play(){
	sonido.volume(0.25)
	sonido.shouldLoop(true)
	sonido.play()
}

method stop(){
	sonido.stop()
}
}