package futbolcinco


import futbolcinco.Partido

interface ModoInscripcion {
	def void inscribirA(Socio interesado, Partido partido, (Partido)=>boolean Condicion)
	def boolean esEstandar()
	def boolean esCondicional()
	def boolean esSolidaria()
	




	
 
 
 
 
}
