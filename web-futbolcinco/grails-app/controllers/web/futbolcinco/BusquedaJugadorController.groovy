package web.futbolcinco

import futbolcinco.homes.JugadoresDenegadosDelSistema
import futbolcinco.homes.PartidosDelSistema
import futbolcinco.homes.SociosDelSistema

class BusquedaJugadorController {
	
	SociosDelSistema sociosDAO = SociosDelSistema.instance()
	PartidosDelSistema partidosDAO = PartidosDelSistema.instance()

	def index() {
		redirect(action: "busquedaJugador", params: params)
	}
	
	def porNombre() {
		def label = "Nombre"
		render ( template:"porNombre", model:[label:label])
	}
	
	def porEdad() {
		def label = "Edad"
		render(template:"porNombre", model:[label:label])
	}
	
	def busquedaJugador() {
		[] 		
	}
	
	def getPorEdad() {
		sociosDAO.buscarPorEdad(0)
	}
}
