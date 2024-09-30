object helado {
  var property position = game.origin()
  method image() = "helado.png"
  var puntos = 0

  method recolectar(fruta){
    game.removeVisual(fruta)
    puntos += 1
  }

  method puntos() = puntos

  method decirPuntos(){
    var mensaje
    if(puntos <=10){
      mensaje = "Recolecté " + self.puntos() + "/10"

    }
    if(puntos <= 20 && puntos > 10){
      mensaje = "Recolecté " + self.puntos() + "/20"
    }
    if(puntos > 20 && puntos <= 25){
      mensaje = "Recolecté " + self.puntos() + "/30"
    }
    
		game.say(self, mensaje)
  }
}