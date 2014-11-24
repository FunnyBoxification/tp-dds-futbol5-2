package futbolcinco


import futbolcinco.Partido
import javax.persistence.MappedSuperclass
import javax.persistence.DiscriminatorColumn
import javax.persistence.DiscriminatorType
import javax.persistence.Id
import javax.persistence.GeneratedValue

@MappedSuperclass
@DiscriminatorColumn(name="modo_inscripcion", discriminatorType=DiscriminatorType.STRING)
abstract class ModoInscripcion {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	def void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean Condicion)
	def boolean esEstandar()
	def boolean esCondicional()
	def boolean esSolidaria()
	




	
 
 
 
 
}
