package futbolcinco

import java.util.LinkedList
import java.util.List
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Reference
import org.mongodb.morphia.annotations.Transient

@Entity
class FichaInscripcion {
	
	@Id
	@Property ObjectId id
	
	@Reference
	Socio inscripto

	@Property ModoInscripcion modoInscripcion
	
	
	@Transient
	@Property Condicion condicion
	
	@Transient
	@Property List<Calificacion> calificaciones	
	
	
	@Property double ponderacion
	
	new() { 
		
	}
	
	
	new(Socio jugador, ModoInscripcion modo, Condicion condicion, Partido partido){
		this.inscripto = jugador
		this.modoInscripcion = modo
		this.condicion = condicion
		this.calificaciones = new LinkedList<Calificacion>
		this.ponderacion = 5.5
//		this.partido = partido
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