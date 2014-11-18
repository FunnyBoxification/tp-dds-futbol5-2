package futbolcinco


import futbolcinco.Partido
import javax.persistence.MappedSuperclass
import javax.persistence.DiscriminatorColumn
import javax.persistence.DiscriminatorType

@MappedSuperclass
@DiscriminatorColumn(name="modo_inscripcion", discriminatorType=DiscriminatorType.STRING)
interface ModoInscripcion {
	def void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean Condicion)
	def boolean esEstandar()
	def boolean esCondicional()
	def boolean esSolidaria()
	




	
 
 
 
 
}
