package web.futbolcinco

import futbolcinco.Administrador
import futbolcinco.Socio
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
		render ( template:"porNombre", model:[label:label, mostrar:true])
	}
	
	def porEdad() {
		def label = "Edad:"
		render(template:"porNombre", model:[label:label,mostrar:true])
	}
	
	def porHandicapDesde() {
		def label = "Handicap desde: "
		render(template:"porNombre",model:[label:label, mostrar:true])
	}
	
	def porHandicapHasta() {
		def label = "Handicap hasta:"
		render(template:"porNombre",model:[label:label,mostrar:true])
	}
	
	def conInfracciones() {
		render(template:"porNombre",model:[label:"",mostrar:false])
	}
	
	def sinInfracciones() {
		render(template:"porNombre",model:[label:"",mostrar:false])
	}
	
	def todos() {
		render(template:"porNombre",model:[label:"",mostrar:false])
	}
	
	//terminar
	/************************************************************************************/
	
	def busquedaJugador() {
		[] 		
	}
	
	def datosJugador(params){
		def j = sociosDAO.buscarPorId(params.id)
		[jugador: j]
	}
	/*************************************************************************************/
	/*************************** MODALIDADES DE BUSQUEDA *********************************/
	def buscarporNombre(params) {
		def nombre = params.paramBusqueda
		def socios = sociosDAO.buscarPorNombre(nombre)
		render ( template:"grilla", model:[socios:socios] )
	}
	
	def buscarporEdad(params) {
		def socios = sociosDAO.buscarPorEdad(new Integer(params.paramBusqueda))
		render ( template:"grilla", model:[socios:socios])
	}
	
	def buscarporHandicapDesde(params) {
		def socios = sociosDAO.buscarPorHandicapDesde(new Integer(params.paramBusqueda))
		render (template:"grilla", model:[socios:socios])
	}
	
	def buscarporHandicapHasta(params) {
		def socios = sociosDAO.buscarPorHandicapHasta(new Integer(params.paramBusqueda))
		render (template:"grilla",model:[socios:socios])
	}
	
	def buscarconInfracciones() {
		def socios = sociosDAO.buscarConInfracciones()
		render(template:"grilla",model:[socios:socios])
	}
	
	def buscarsinInfracciones() {
		def socios = sociosDAO.buscarSinInfracciones()
		render(template:"grilla",model:[socios:socios])
	}
	
	def buscartodos() { 
		def socios = sociosDAO.elements()
		render(template:"grilla",model:[socios:socios])
	}
	
	def buscarporPromDesde() {
		
	}
	
	def buscarporPromHasta() {
		
	}
	
	/********************************************************************************************/

}
