package observers

import futbolcinco.Partido
import futbolcinco.Socio

class InfraccionarObserver implements ModificacionObserver {
	MessageSender messageSender
	
	new(MessageSender pMessageSender){
		messageSender = pMessageSender
	}
	
	
	override send(Socio interesado,Partido partido){
		interesado.aplicarInfraccion(12052014,19052014,"se bajo de partido sin remplazo") //sera programable// dia de hoy?
	}
	
	
	
}
		