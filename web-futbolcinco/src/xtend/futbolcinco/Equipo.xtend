package futbolcinco

import java.util.List
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToMany
import org.hibernate.annotations.LazyCollection
import org.hibernate.annotations.LazyCollectionOption

@Entity
class Equipo {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy="equipo", cascade = CascadeType.ALL)
	public List<FichaInscripcion> _integrantes
	
	@Column(name="numeroEquipo")
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