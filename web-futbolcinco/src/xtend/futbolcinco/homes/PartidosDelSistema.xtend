package futbolcinco.homes



class PartidosDelSistema {
	@Property ClasesDePartidos partidosJugados
	@Property ClasesDePartidos partidosListosParaJugar 
	@Property ClasesDePartidos partidosArmandose
	
	private static PartidosDelSistema instance
	
	new(){//puse public
		partidosJugados = new ClasesDePartidos
		partidosListosParaJugar = new ClasesDePartidos
		partidosArmandose = new ClasesDePartidos
	}
	
	def static instance() {
		if(instance == null) 
			return new PartidosDelSistema
		else return instance
	}
}