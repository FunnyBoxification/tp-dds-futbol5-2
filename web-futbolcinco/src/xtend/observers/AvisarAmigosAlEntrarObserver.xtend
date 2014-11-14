package observers

import futbolcinco.Partido
import observers.ModificacionObserver
import futbolcinco.Socio

class AvisarAmigosAlEntrarObserver implements ModificacionObserver {
	MessageSender messageSender
	
	new(MessageSender pMessageSender){
		messageSender = pMessageSender
	}
	
	override send(Socio interesado,Partido partido){
		if(interesado.amigos != null) {
			interesado.amigos.forEach [amigo | 
			var mail = new Mail
			mail.from = interesado.casilla
			mail.to = amigo.casilla
			mail.title = "Voy a jugar un partido!!"
			mail.message = "Voy a jugar un partido el " + partido.dia +" a las" + partido.hora + ". Te copas?"
			messageSender.send(mail)
			]
			
		}
	}
	
}