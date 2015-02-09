package dtos

import futbolcinco.Socio
import org.bson.types.ObjectId

class SocioDTO {
	
	@Property ObjectId id
	@Property String nombre
	@Property Integer edad
	@Property Integer handicap
	@Property double promedio
	
	
	new() {
		
	}
	
	new(Socio socio) {
		id = socio.id
		nombre = socio.nombre
		edad = socio.edad
		handicap = socio.handicap
		promedio = socio.promedio		
	}
	
}