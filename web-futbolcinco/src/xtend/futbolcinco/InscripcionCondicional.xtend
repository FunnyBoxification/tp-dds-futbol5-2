package futbolcinco

import Exceptions.PartidoCompletoException
import javax.persistence.Entity
import javax.persistence.DiscriminatorValue

@Entity
@DiscriminatorValue("COND")
class InscripcionCondicional extends ModoInscripcion {
	
	
	
	override void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean condicion) {
		if(partido.getInscriptos.size < 10) {
		//	if(condicion == null) {
		//		throw new CondicionNulaException
		//	
		//	else if(!condicion.apply(partido)) { // Evaluo la lambda o deberia ser ya una condicion?
			//	throw new PartidoNoCumpleCondicionException
			//}    Se saca por ahora
		
			partido.getInscriptos.add(new FichaInscripcion(interesado,this, new Condicion(condicion), partido))
			partido.notificaInscripto(interesado)
		}
		else {
			throw new PartidoCompletoException()
		}
		
	}
	
	override esEstandar() {
		false
	}
	
	override esCondicional() {
		true
	}
	
	override esSolidaria() {
		false
	}
	
}