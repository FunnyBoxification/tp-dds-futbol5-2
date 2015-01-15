package web.futbolcinco

import futbolcinco.Administrador
import futbolcinco.Socio
import futbolcinco.homes.JugadoresDenegadosDelSistema
import futbolcinco.homes.PartidosDelSistema
import futbolcinco.homes.SociosDelSistema
import grails.converters.JSON

class BusquedaJugadorController {
	
	SociosDelSistema sociosDAO = SociosDelSistema.instance()
	//TODO: Agregar los DAOS con MongoDB
	// false => SQL , TRUE => MONGODB
	PartidosDelSistema partidosDAO = PartidosDelSistema.instance(false)
	
	//TODO: Agregar validaciones desde un js con spans con display none que se muestran si se escribe algo mal.

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
	
	def porPromDesde() { 
		render(template:"porNombre",model:[label:"Promedio desde:",mostrar:true])
	}
	
	def porPromHasta() {
		render(template:"porNombre",model:[label:"Promedio hasta:",mostrar:true])
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
//		try {
			def edad = new Integer(params.paramBusqueda)
			def socios = sociosDAO.buscarPorEdad(edad)
			render ( template:"grilla", model:[socios:socios])
//		}
		/*catch(NumberFormatException) {
			render(template:"errorSpan",model:[errorMessage:"Debe ingresar un numero para la edad"])
		}*/
	}
	
	def buscarporHandicapDesde(params) {
		try {
			def socios = sociosDAO.buscarPorHandicapDesde(new Integer(params.paramBusqueda))
			render (template:"grilla", model:[socios:socios])
		}
		catch(NumberFormatException) {
			render(template:"errorSpan",model:[errorMessage:"Debe ingresar un numero para el handicap"])
		}
	}
	
	def buscarporHandicapHasta(params) {
		try {
			def socios = sociosDAO.buscarPorHandicapHasta(new Integer(params.paramBusqueda))
			render (template:"grilla",model:[socios:socios])
		}
		catch(NumberFormatException) {
			render(template:"errorSpan",model:[errorMessage:"Debe ingresar un numero para el handicap"])
		}
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
		render(template:"errorSpan",model:[errorMessage:"Funcionalidad no implementada"])
	}
	
	def buscarporPromHasta() {
		render(template:"errorSpan",model:[errorMessage:"Funcionalidad no implementada"])
	}
	
	/********************************************************************************************/

}
