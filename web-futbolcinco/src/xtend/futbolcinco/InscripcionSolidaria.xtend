package futbolcinco

import Exceptions.PartidoCompletoException


class InscripcionSolidaria extends ModoInscripcion {
	
	
	override void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean condicion) {		
		val condicional = partido.getInscriptos.findFirst[ ficha | ficha.modoInscripcion.esCondicional]
		if(partido.getInscriptos.size == 10) {
			if(condicional == null) {
				throw new PartidoCompletoException
			}
			else {
				partido.getInscriptos.remove(condicional)
			}
		
			partido.getInscriptos.add(new FichaInscripcion(interesado,this,null,partido))
			partido.notificaInscripto(interesado)
		}
		else if(partido.getInscriptos.size < 10) { 
			partido.getInscriptos.add(new FichaInscripcion(interesado,this,null,partido))
			partido.notificaInscripto(interesado)
			
		}
		else {
			throw new PartidoCompletoException
		}
	}
	
	override esEstandar() {
		false 
	}
	
	override esCondicional() {
		false
	}
	
	override esSolidaria() {
		true
	}
	
}