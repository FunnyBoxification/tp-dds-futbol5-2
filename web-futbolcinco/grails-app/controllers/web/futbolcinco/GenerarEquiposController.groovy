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
import futbolcinco.FichaInscripcion
import futbolcinco.Partido
import futbolcinco.Socio
import futbolcinco.homes.AdministradoresDelSistema
import futbolcinco.homes.PartidosDelSistema
import futbolcinco.homes.SociosDelSistema

class GenerarEquiposController {
	
	def static Administrador admin
	def static Map mapaModosDivision
	def static Map mapaCriteriosOrden
	
	SociosDelSistema sociosDAO = SociosDelSistema.instance()
	AdministradoresDelSistema adminsDAO = AdministradoresDelSistema.instance()
	//TODO: Agregar los DAOS con MongoDB
	// false => SQL , TRUE => MONGODB
	PartidosDelSistema partidosDAO = PartidosDelSistema.instance()
	
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
		admin.setHomePartidos(PartidosDelSistema.instance())
		Partido p = conseguirPartidoEnHome()
		[partido:p]
	}
	
	def generarEquipos(){
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
		equipos.add(partidosDAO.getListaSociosDTOEquipo1(newP))
		equipos.add(partidosDAO.getListaSociosDTOEquipo2(newP))
		render(template: 'grillasEquipos', model : [equipos: equipos])
	}
	
	/* ----- Metodos Privados -----*/
	
	private LinkedList<Socio> conseguirListaSocios(List<FichaInscripcion> fichasInsc){
		def equipo = new LinkedList<Socio>()
		for (var in fichasInsc) {
			equipo.add(var._inscripto)
		}
		equipo
	}
	
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
