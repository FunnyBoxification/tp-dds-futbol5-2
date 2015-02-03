package dtos

import futbolcinco.Socio

class SocioDTO {
	
	@Property Long id
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