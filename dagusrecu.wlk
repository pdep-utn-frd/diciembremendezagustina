object oceano {

}
class Ciudadflotante{
    const capacidadmaxima 
    const niveltecnologico
    var grado 
    var property trabajadores=[] 
    method niveldetecno()=grado
    method agregartrabajadores(trabajador){
        if(trabajadores.size()<capacidadmaxima )
        trabajadores.add (trabajador)
        throw new Exception
        (message="supera la cantidad maxima permitida") }


    method delegacionexperimentada() = 
    trabajadores.all{t=>t.experimentado()}
    method esavanzada() = self.niveldetecno() > 5
     and trabajadores.all{t=>t.esHabil()}
    method capacidadreal() = self.delegacionexperimentada().sum
    {t=>t.potenciat()}
}

        

class Trabajador {
    var edad
    var  potencia 
    var habilidad
    method experimentado() = edad > 50
    method esPotente() = potencia >= 20
    method esHabil() = habilidad > 12
    method potenciat() = potencia
}
