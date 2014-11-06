package futbolcinco

import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToOne

class Calificacion {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	//TODO:asd
	@OneToOne (fetch=FetchType.LAZY)
	@Property Partido partido
	
	
	@Property Socio calificador
	
	@Property Socio calificado
	
	@Property Integer puntaje
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