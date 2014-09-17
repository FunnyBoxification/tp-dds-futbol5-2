package web.futbolcinco

import futbolcinco.homes.JugadoresDenegadosDelSistema
import futbolcinco.homes.PartidosDelSistema
import futbolcinco.homes.SociosDelSistema
import grails.converters.JSON

class BusquedaJugadorController {
	
	SociosDelSistema sociosDAO = SociosDelSistema.instance()
	PartidosDelSistema partidosDAO = PartidosDelSistema.instance()

	def index() {
		redirect(action: "busquedaJugador", params: params)
	}
	
	/******************************************************************************/
	def porNombre() {
		def label = "Nombre:"
		render ( template:"porNombre", model:[label:label])
	}
	
	def porEdad() {
		def label = "Edad:"
		render(template:"porNombre", model:[label:label])
	}
	
	def porHandicapDesde() {
		def label = "Handicap desde: "
		render(template:"porNombre",model:[label:label])
	}
	
	def porHandicapHasta() {
		def label = "Handicap hasta:"
		render(template:"porNombre",model:[label:label])
	}
	
	//terminar
	/************************************************************************************/
	
	def busquedaJugador() {
		[] 		
	}
	
	/*************************************************************************************/
	def buscarPorNombre(params) {
		def nombre = params.paramBusqueda
		//tendria que hacer un render de esto??????
		sociosDAO.buscarPorNombre(nombre).collect { 
			socio -> [  nombre:socio.nombre,
						handicap:socio.handicap,
						edad:socio.edad ] as JSON 
		}
	}
}
