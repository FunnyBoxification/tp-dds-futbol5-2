package futbolcinco

import java.util.List
import org.mongodb.morphia.annotations.Embedded

@Embedded
class Equipo {

	public List<FichaInscripcion> _integrantes
	
	@Property int numeroEquipo
	
	new() {
		
	}
	
	
	def List<FichaInscripcion> getIntegrantes() {
		_integrantes
	}
	
	def void setIntegrantes(List<FichaInscripcion> inte) {
		this._integrantes = inte
	}
}