package observers

import futbolcinco.Partido
import futbolcinco.Socio

interface ModificacionObserver {
	
	def void send(Socio interesado,Partido partido)
	
}