package futbolcinco

import javax.persistence.Entity
import javax.persistence.DiscriminatorValue

@Entity
@DiscriminatorValue("EST")
class InscripcionEstandar extends ModoInscripcion {
	
	
	override void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean condicion) {		
			val condicional = partido.getInscriptos.findFirst[ficha | ficha.modoInscripcion.esCondicional ]
			val solidario = partido.getInscriptos.findFirst[ ficha | ficha.modoInscripcion.esSolidaria]
			if(partido.getInscriptos.size == 10) {
				if(condicional != null) {
					partido.getInscriptos.remove(condicional)
				}
				else if(solidario != null) {
					partido.getInscriptos.remove(solidario) 
				}
			
		}
		
		partido.getInscriptos.add(new FichaInscripcion(interesado,this,null))
		
		partido.notificaInscripto(interesado)
		
		
	}
	
	override esEstandar() {
		true
	}
	
	override esCondicional() {
		false
	}
	
	override esSolidaria() {
		false 
	}
	
}