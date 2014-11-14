package futbolcinco

import javax.persistence.GeneratedValue
import javax.persistence.Id

class JugadorPropuesto {
	
	@Id
	@GeneratedValue
	@Property Long id

	@Property String nombre
	@Property Integer edad
	@Property String casilla
	

	
	//Sino falla el constructor de JugadorDenegado, ya que JugadorDenegado nunca podria llamar a super()
	new() {
		super()
	}
	
	new (String nombre,Integer anios,String mail){
		this.nombre = nombre
		this.edad = anios
		this.casilla = mail
		
	}
}