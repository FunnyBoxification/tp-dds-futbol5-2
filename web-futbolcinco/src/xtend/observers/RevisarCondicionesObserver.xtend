package observers

import futbolcinco.Partido
import futbolcinco.Socio

class RevisarCondObs implements ModificacionObserver {
	
	override send(Socio interesado,Partido partido){
		partido.inscriptos.forEach [ficha | partido.sacarCondMal(ficha) ]  
		
		
	}
	
	
}