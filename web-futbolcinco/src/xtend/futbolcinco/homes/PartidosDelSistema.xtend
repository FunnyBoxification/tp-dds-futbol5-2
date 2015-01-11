package futbolcinco.homes

//TODO: Cuando se use mmongo hay que usar el otro home no el ClasesDePartidos
class PartidosDelSistema {
	@Property ClasesDePartidos partidosJugados
	@Property ClasesDePartidos partidosListosParaJugar 
	@Property ClasesDePartidos partidosArmandose
	
	private static PartidosDelSistema instance
	
	new(boolean mongo){//puse public
		if(!mongo)
		{
			partidosJugados = new ClasesDePartidosSQL
			partidosListosParaJugar = new ClasesDePartidosSQL
			partidosArmandose = new ClasesDePartidosSQL
		}
		else {
			partidosJugados = new PartidosDAOMongo
			partidosListosParaJugar = new PartidosDAOMongo
			partidosArmandose = new PartidosDAOMongo
		}
	}
	
	new() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def static instance(boolean mongo) {
		if(instance == null) 
			return new PartidosDelSistema(mongo)
		else return instance
	}
}