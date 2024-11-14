object musica{
  var property cancion = null

  method sonido_on(){
    self.cancion().volume(0.03)
    self.cancion().play()
  }

  method sonido_off() {
    self.cancion().stop()
  }

  method sonido_pause() {
    self.cancion().pause()
  }

  method sonido_continue() {
    self.cancion().resume()
  }
}