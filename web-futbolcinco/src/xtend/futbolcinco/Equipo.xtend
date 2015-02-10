package futbolcinco

import java.util.List
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Reference

@Embedded
class Equipo {
	
	@Reference
	List<FichaInscripcion> _integrantes
	
	@Property int numeroEquipo
	
	new() {
		
	}
	
	
	def List<FichaInscripcion> getIntegrantes() {
		this._integrantes
	}
	
	def void setIntegrantes(List<FichaInscripcion> inte) {
		this._integrantes = inte
	}
}