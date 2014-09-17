package web.futbolcinco

import futbolcinco.homes.JugadoresDenegadosDelSistema
import futbolcinco.homes.SociosDelSistema

class BusquedaJugadorController {
	
	SociosDelSistema sociosDAO = new SociosDelSistema() //Deberian ser un singletonnnn todos los homes

    def index() { 
		redirect(action:"generarEquipos")
	}
	
	def generarEquipos(){
		
	}
}
