package futbolcinco

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToOne
import javax.persistence.Table
import javax.persistence.Transient

@Entity
@Table (name="calificacion")
class Calificacion {
	@Id
	@GeneratedValue
	@Property Long id
	
	@Transient
	@Property Partido partido
	
	@Transient
	@Property Socio calificador
	
	@Transient
	@Property Socio calificado
	
	@Column
	@Property Integer puntaje
	
	@Column
	@Property String opinion
	
	
	new (Partido unPartido, Socio unInteresado,Socio otroInteresado, Integer nota, String resenia){
		this.partido= unPartido
		this.calificador = unInteresado
		this.calificado = otroInteresado
		this.puntaje = nota
		this.opinion = resenia
	}
	
		new (Partido unPartido, Socio calificador, Integer nota, String resenia){
		this.partido= unPartido
		this.calificador = calificador
		this.puntaje = nota
		this.opinion = resenia
	}
		
}