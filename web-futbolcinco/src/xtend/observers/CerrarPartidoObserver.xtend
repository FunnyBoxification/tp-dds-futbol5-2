package observers

import futbolcinco.Partido
import futbolcinco.Socio

class CerrarPartidoObserver implements ModificacionObserver {
	MessageSender messageSender
	
	new(MessageSender pMessageSender){
		messageSender = pMessageSender
	}
	
	//PONER ESTE OBSERVER SOLO EN INSCRIPCION
	override send(Socio interesado,Partido partido){
			if(partido.getInscriptos.size == 9){

					var mail =new Mail
					mail.from = interesado.casilla
					mail.to = partido.admin.casilla
					mail.title = "Partido Completo"
					mail.message = "He completado el partido del "+ partido.dia +" a las " + partido.hora +", esta listo para jugar"//insertarfechas
					messageSender.send(mail)
				
			}
		}
	
		

	
}