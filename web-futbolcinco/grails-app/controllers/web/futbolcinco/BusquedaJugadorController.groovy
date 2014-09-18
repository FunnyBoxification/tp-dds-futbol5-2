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
	
	def datosJugador(String nombre){
		def j = buscarSocioPorId(nombre)
		[jugador: j]
	}
	/*************************************************************************************/
	/*************************** MODALIDADES DE BUSQUEDA *********************************/
	def buscarporNombre(params) {
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
	
	/********************************************************************************************/
	
	def private buscarSocioPorId(String id){
		def Socio s = new Socio("Juan", 21, "mail@baba.com", new Administrador("random@admin.com"));
		s.setHandicap(6)
		s
	}
}
