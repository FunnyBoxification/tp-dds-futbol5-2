package futbolcinco

import javax.persistence.DiscriminatorColumn
import javax.persistence.DiscriminatorType
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.DiscriminatorValue

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="modo_inscripcion", discriminatorType=DiscriminatorType.STRING)
@DiscriminatorValue("MOD")
abstract class ModoInscripcion {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	def void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean Condicion)
	def boolean esEstandar()
	def boolean esCondicional()
	def boolean esSolidaria()
	
}
