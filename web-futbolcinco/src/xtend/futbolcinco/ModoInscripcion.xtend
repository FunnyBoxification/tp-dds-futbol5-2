package futbolcinco

import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Transient

@Entity
abstract class ModoInscripcion {
	
	@Id
	@Property ObjectId id
	
	def void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean Condicion)
	def boolean esEstandar()
	def boolean esCondicional()
	def boolean esSolidaria()
	
}
