package futbolcinco.homes



class PartidosDelSistema {
	@Property ClasesDePartidos partidosJugados
	@Property ClasesDePartidos partidosListosParaJugar 
	@Property ClasesDePartidos partidosArmandose
	
	new(){
		partidosJugados = new ClasesDePartidos
		partidosListosParaJugar = new ClasesDePartidos
		partidosArmandose = new ClasesDePartidos
	}
}