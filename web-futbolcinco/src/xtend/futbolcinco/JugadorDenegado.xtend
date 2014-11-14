package futbolcinco

class JugadorDenegado extends JugadorPropuesto {
	//@Property String nombre
	//@Property Integer edad
	//@Property String casilla
	@Property String motivo
	@Property int fecha


	
	new (String nombre,Integer anios,String mail,String motivo, int fecha){
		this.nombre = nombre
		this.edad = anios
		this.casilla = mail
		this.motivo = motivo
		this.fecha = fecha
	}

	new(JugadorPropuesto jugador, String motivo, int dia ){
		nombre =jugador.nombre
		edad = jugador.edad
		casilla = jugador.casilla
		this.motivo = motivo
		this.fecha=  dia
	}

}