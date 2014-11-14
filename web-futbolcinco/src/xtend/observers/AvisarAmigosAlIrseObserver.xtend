package observers

import futbolcinco.Partido
import observers.ModificacionObserver
import futbolcinco.Socio

class AvisarAmigosAlIrseObserver implements ModificacionObserver {
	MessageSender messageSender
	
	new(MessageSender pMessageSender){
		messageSender = pMessageSender
	}
	
	override send(Socio interesado,Partido partido){
		
				interesado.amigos.forEach [amigo | 
				var mail = new Mail
				mail.from = interesado.casilla
				mail.to = amigo.casilla
				mail.title = "Me baje del patrido."
				mail.message = "No voy a jugar un partido el " + partido.dia +" a las" + partido.hora + ". Lo siento."
				messageSender.send(mail)
				]	
			
		}
	
}