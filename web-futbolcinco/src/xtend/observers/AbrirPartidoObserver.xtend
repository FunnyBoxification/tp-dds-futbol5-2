package observers

import futbolcinco.Partido
import futbolcinco.Socio

class AbrirPartidoObserver implements ModificacionObserver {
	MessageSender messageSender
	
	new(MessageSender pMessageSender){
		messageSender = pMessageSender
	}
	
	
	override send(Socio interesado,Partido partido){
			 if (partido.getInscriptos.size == 10){
			 				
				var mail =new Mail
				mail.from = interesado.casilla
				mail.to = partido.admin.casilla
				mail.title = interesado.nombre+"abandono el partido, el partido se abrio nuevamente"
				mail.message = "Tuve que dejar el partido de las "+ partido.dia +" a las " + partido.hora+"."
				messageSender.send(mail)	
		}
	}
	
}