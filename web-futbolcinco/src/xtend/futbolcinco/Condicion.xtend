package futbolcinco

@Data class Condicion {
	(Partido)=>boolean bloqueCondicion
	
	def boolean cumplePara(Partido partido) {
		if (bloqueCondicion==null){
			return false
		}else
		bloqueCondicion.apply(partido)
	}
}