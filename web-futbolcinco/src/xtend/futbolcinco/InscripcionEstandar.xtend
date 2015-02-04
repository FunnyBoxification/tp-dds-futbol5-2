package futbolcinco

import futbolcinco.homes.PartidosDelSistema
import javax.persistence.DiscriminatorValue
import javax.persistence.Entity

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
		
		partido.getInscriptos.add(new FichaInscripcion(interesado,this,null,partido))
		
		partido.notificaInscripto(interesado)
		
		PartidosDelSistema.instance().agregarOActualizar(partido)
//		PartidosDAOMongo.instance().agregarOActualizar(partido)
		
		
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