package futbolcinco

import java.util.LinkedList
import java.util.List
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToOne
import javax.persistence.OneToOne
import javax.persistence.Table
import javax.persistence.Transient

@Entity
@Table(name = "inscripciones")
class FichaInscripcion {
	@Id
	@GeneratedValue
	@Property Long id
	
	@ManyToOne
	Socio inscripto
	
	@OneToOne //Es una negrada lo se
	@Property ModoInscripcion modoInscripcion
	
	@Transient
	@Property Condicion condicion
	
	@Transient //por ahora 
	@Property List<Calificacion> calificaciones	
	
	@Column
	@Property double ponderacion
	//@Property int handicap
	
	new(Socio jugador, ModoInscripcion modo, Condicion condicion){
		this.inscripto = jugador
		this.modoInscripcion = modo
		this.condicion = condicion
		this.calificaciones = new LinkedList<Calificacion>
		this.ponderacion = 5.5
	}
	new(Socio jugador, ModoInscripcion modo){
		this.inscripto = jugador
		this.modoInscripcion = modo
		this.condicion = null
		this.calificaciones = new LinkedList<Calificacion>
	}
	
	def Socio getInscripto() {
		inscripto
	}
	
	def void setInscripto(Socio socio) {
		inscripto = socio
	}
}