package futbolcinco

import futbolcinco.homes.PartidosDAOMongo
import org.mongodb.morphia.annotations.Entity
import futbolcinco.homes.InscripcionesHomeMongo

@Entity
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
		
		var ficha = new FichaInscripcion(interesado,this,null,partido)
		InscripcionesHomeMongo.instance().agregarOActualizar(ficha)
		partido.getInscriptos.add(ficha)
		
		partido.notificaInscripto(interesado)
		
//		PartidosDelSistema.instance().agregarOActualizar(partido)
		PartidosDAOMongo.instance().agregarOActualizar(partido)
		
		
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