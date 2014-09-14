package futbolcinco

class JugadorPropuesto {

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