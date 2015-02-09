package web.futbolcinco

import strategy.DivisionEspecifica
import strategy.DivisionParImpar
import strategy.ModoDivision

import command.CalificacionesUltimoPartido
import command.Criterio
import command.CriterioMix
import command.CriterioPorHandicap
import command.UltimasCalificaciones

import futbolcinco.Administrador
import futbolcinco.ConstantesEnum
import futbolcinco.Partido
import futbolcinco.homes.AdministradoresDAOMongo
import futbolcinco.homes.PartidosDAOMongo
import futbolcinco.homes.SociosDAOMongo

class GenerarEquiposController {
	
	def static Administrador admin
	def static Map mapaModosDivision
	def static Map mapaCriteriosOrden
	
	SociosDAOMongo sociosDAO = SociosDAOMongo.instance()// = SociosDelSistema.instance()
	AdministradoresDAOMongo adminsDAO = AdministradoresDAOMongo.instance()// = AdministradoresDelSistema.instance()
	//TODO: Agregar los DAOS con MongoDB
	// false => SQL , TRUE => MONGODB
	PartidosDAOMongo partidosDAO = PartidosDAOMongo.instance()// = PartidosDelSistema.instance()
	
    def index() { 
		redirect(action:"generarEquiposPag")
		admin = adminsDAO.getByMail("admin@admin.com")
		admin.setHomeSocios(sociosDAO)
		//admin.setHomeJugadoresDenegados(JugadoresPropuestosDelSistema.instance)
//		admin.setHomePartidos(PartidosDelSistema.instance())
	
	}
	
	def generarEquiposPag() {
		admin = adminsDAO.getByMail("admin@admin.com")
		admin.setHomeSocios(sociosDAO)
		//admin.setHomeJugadoresDenegados(JugadoresPropuestosDelSistema.instance)
		admin.setHomePartidos(PartidosDAOMongo.instance())
		Partido p = conseguirPartidoEnHome()
		if(p.estado == ConstantesEnum.PARTIDO_JUGADO) {
			redirect(action:"equiposGenerados")
		}
		[partido:p]
	}
	
	def generarEquipos(){
	}
	
	def equiposGenerados() { 
		Partido p = conseguirPartidoEnHome()
		def LinkedList equipos = new LinkedList<LinkedList>()
//		equipos.add(p.equipo1.integrantes.map[ socio ])
//		equipos.add(p.equipo2.integrantes)
		equipos.add(partidosDAO.getListaSociosEquipo1(p))
		equipos.add(partidosDAO.getListaSociosEquipo2(p))
		[equipos: equipos]
	}
	
	/* FALTA HACER QUE ORDENE LOS JUGADORES ANTES DE DIVIDIRLOS */
	def solicitarEquipos(){
		mapaModosDivision = new HashMap<String, ModoDivision>()
		mapaModosDivision.put("Par/Impar", new DivisionParImpar())
		mapaModosDivision.put("1,4,5,8,9", new DivisionEspecifica())

		mapaCriteriosOrden = new HashMap<String, Criterio>()
		mapaCriteriosOrden.put("Handicap", new CriterioPorHandicap() )
		mapaCriteriosOrden.put("Promedio calificaciones ultimo partido", new CalificacionesUltimoPartido())
		mapaCriteriosOrden.put("Criterio Mixto", new CriterioMix())
		mapaCriteriosOrden.put("Promedio calificaciones ultimos n partidos", new UltimasCalificaciones())
		Partido p = conseguirPartidoEnHome()
		p = admin.ordenarJugadoresPorCriterio(p, conseguirCriterioOrden(params.get("criterioOrden")))
		def Partido newP = admin.hacerDivision(p, conseguirModoDivision(params.get("criterioSeleccion")))
		/*def equipo1 = conseguirListaSocios(newP.equipo1)
		def equipo2 = conseguirListaSocios(newP.equipo2)*/
		def LinkedList equipos = new LinkedList<LinkedList>()
		equipos.add(newP.equipo1.integrantes)
		equipos.add(newP.equipo2.integrantes)
//		equipos.add(partidosDAO.getListaSociosDTOEquipo1(newP))
//		equipos.add(partidosDAO.getListaSociosDTOEquipo2(newP))
		render(template: 'grillasEquipos', model : [equipos: equipos])
	}
	
	def confirmarEquipos() {
		Partido p = conseguirPartidoEnHome()
		admin.confirmarEquipos(p,p)
	}
	
	/* ----- Metodos Privados -----*/
	
	
	private ModoDivision conseguirModoDivision(String modo){
		mapaModosDivision.get(modo)
	}
	
	private Criterio conseguirCriterioOrden(String criterio){
		mapaCriteriosOrden.get(criterio)
	}
	
	private Partido conseguirPartidoEnHome(){
		partidosDAO.buscarPartido(1)
	} 
	
	
}
