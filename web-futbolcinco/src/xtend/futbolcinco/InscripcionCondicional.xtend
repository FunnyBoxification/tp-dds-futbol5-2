package futbolcinco

import Exceptions.PartidoCompletoException
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Transient

@Entity
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