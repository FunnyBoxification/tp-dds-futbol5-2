package futbolcinco

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name="infracciones")
class Infraccion {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	@Property Integer desde
	
	@Property Integer hasta
	
	@Property String motivo
	
	new() {
		
	}
	
	new(Integer desde, Integer hasta, String motivo) {
		this.desde = desde
		this.hasta = hasta
		this.motivo = motivo
	}
}