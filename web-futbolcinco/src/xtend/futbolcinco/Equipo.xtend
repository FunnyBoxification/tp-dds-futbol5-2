package futbolcinco

import java.util.List
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import javax.persistence.OneToOne

@Entity
class Equipo {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "equipo")
	List<FichaInscripcion> integrantes
	
	@OneToOne
	@Property Partido partido
	
	@Property int numeroEquipo
	
	
	def List<FichaInscripcion> getIntegrantes() {
		integrantes
	}
	
	def void setIntegrantes(List<FichaInscripcion> inte) {
		this.integrantes = inte
	}
}