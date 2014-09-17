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
	
	def datosJugador(String id){
		def j = buscarSocioPorId(id)
		[jugador: j]
	}
	/*************************************************************************************/
	/*************************** MODALIDADES DE BUSQUEDA *********************************/
	def buscarPorNombre(params) {
		def nombre = params.paramBusqueda
		//tendria que hacer un render de esto??????
		//Mepa que es totally al pedou mandarlo como JSON, le paso
		//la lista, scriptlet y a la mierda
		
//		sociosDAO.buscarPorNombre(nombre).collect { 
//			socio -> [  nombre:socio.nombre,
//						handicap:socio.handicap,
//						edad:socio.edad ] as JSON 
//		}
		
		//otra opcion que creo que es mas copada
		def socios = sociosDAO.buscarPorNombre(nombre)
		render ( template:"grilla", model:[socios:socios] )
	}
	
	def buscarPorEdad(params) {
		def socios = sociosDAO.buscarPorEdad(new Integer(params.paramBusqueda))
		render ( template:"grilla", model:[socios:socios])
	}
	
	def buscarPorHandicapDesde(params) {
		def socios = sociosDAO.buscarPorHandicapDesde(new Integer(params.paramBusqueda))
		render (template:"grilla", model:[socios:socios])
	}
	
	def buscarPorHandicapHasta(params) {
		def socios = sociosDAO.buscarPorHandicapHasta(new Integer(params.paramBusqueda))
		render (template:"grilla",model:[socios:socios])
	}
	
	def buscarConInfracciones() {
		def socios = sociosDAO.buscarConInfracciones()
		render(template:"grilla",model:[socios:socios])
	}
	
	def buscarSinInfracciones() {
		def socios = sociosDAO.buscarSinInfracciones()
		render(template:"grilla",model:[socios:socios])
	}
	
	/********************************************************************************************/
	
	def private buscarSocioPorId(String id){
		def Socio s = new Socio("Juan", 21, "mail@baba.com", new Administrador("random@admin.com"));
		s.setHandicap(6)
		s
	}
}
