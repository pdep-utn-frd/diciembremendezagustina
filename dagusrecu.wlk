
class Ciudadflotante{
    var capacidadmaxima 
    var property grado 
    var property trabajadores=[] 
    method niveldetecno()=grado
    method agregartrabajadores(trabajador){
        if(trabajadores.size()<capacidadmaxima )
        trabajadores.add (trabajador) else
        throw new Exception
        (message="supera la cantidad maxima permitida") }

    method defensainicial()=trabajadores.count{}
    method delegacionexperimentada() = 
    trabajadores.all{t=>t.experimentado()}
    method esavanzada() = self.niveldetecno() > 5
     and trabajadores.all{t=>t.eshabil()}
    method capacidadreal() = self.delegacionexperimentada().sum
    {t=>t.potenciat()}
    method todossonhabiles() = trabajadores.all{t=>t.eshabil()}
     method solicitarAporte(trabajador) {trabajadores.all{t=>t.notificarse(self)}}
    
    method ampliartecno(x) { grado = grado + x return grado}
    method aumentarcapacidad(x) {capacidadmaxima = (capacidadmaxima + x )return capacidadmaxima}
    method quitartrabajador(trabajador) {trabajadores.remove(trabajador)}
     method elmasjoven() = trabajadores.min{t=>t.edad()}
    method quitarmasjoven() {trabajadores.remove(self.elmasjoven())}
}


        

class Trabajador {
    var property  edad
    var property potencia =20
    var habilidad=0
    method habilidad()=habilidad
    method experimentado() = edad > 50
    method entrenamiento(){}
    method esexperimentado()=edad.between(25,35)
    method espotente() = potencia >= 20
    method eshabil() = habilidad > 12
    method potenciat() = potencia

     method adulto() {
    if (edad.between(20,40) )
     {habilidad = 15}
      else{ habilidad = 10}
    }

    method notificarse(ciudadflotante) { self.aporte(ciudadflotante)}
    method edad() = edad
    method jubilarse(ciudadflotante) {
        not self.aporte(ciudadflotante) ciudadflotante.quitarTrabajador(self)
        }
    method aporte(ciudadflotante) { 
        ciudadflotante.aumentarcapacidad(1)
       return  if (self.edad() > 65){
            self.jubilarse(ciudadflotante)
        } }
}

class Ingeniero inherits Trabajador {
    var conocimiento = 5
    override method habilidad() { return super() + conocimiento * 3}
    override method esexperimentado() = conocimiento > 8
    method aumentarconocimiento(x) { conocimiento = conocimiento + x return conocimiento}
    override method entrenamiento() {
        if (self.esexperimentado()) {
            self.aumentarconocimiento(3)
        }else{
            self.aumentarconocimiento(2)
        }
    }
    method estadoflasheo(){}
     override method aporte(ciudadflotante) { 
        ciudadflotante.ampliartecno(1)
        self.estadoflasheo()
    return}

}

class Guardia inherits Trabajador {
    var reserva = 100
    override method potenciat() = super() + reserva * 0.1
    method tienereserva() = reserva > 150
    method topereserva() =  reserva >= 300
    method disminuirreserva(x){reserva=reserva + x return reserva}
    method aumentareserva(x) { reserva = reserva + x return reserva}
    override method esexperimentado() = self.potenciat() > 50 || self.tienereserva()
    override method entrenamiento() {self.aumentareserva(10) and not self.topereserva()} 
    method defender(x){self.disminuirreserva(x)}

}
object consorcio {
    const ciudadflotante = []
    method cantFlotantes() = ciudadflotante.size()
    method crear()  {
    const losmasjovenes = ciudadflotante.map{f=>f.elmasjoven()}
    ciudadflotante.add(new Ciudadflotante
    (grado = 5,capacidadmaxima = ciudadflotante.size(),trabajadores = losmasjovenes))
    self.abandonar() }
    method abandonar() { ciudadflotante.forEach{f=>f.quitarmasjoven()}
    }

}