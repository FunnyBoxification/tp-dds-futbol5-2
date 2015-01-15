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
import futbolcinco.InscripcionEstandar
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
	PartidosDelSistema partidosDAO = PartidosDelSistema.instance(false)
	
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
		admin.setHomePartidos(PartidosDelSistema.instance(false))
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
		def equipo1 = conseguirListaSocios(newP.equipo1)
		def equipo2 = conseguirListaSocios(newP.equipo2)
		def LinkedList equipos = new LinkedList<LinkedList>()
		equipos.add(equipo1)
		equipos.add(equipo2)
		render(template: 'grillasEquipos', model : [equipos: equipos])
	}
	
	/* ----- Metodos Privados -----*/
	
	private LinkedList<Socio> conseguirListaSocios(HashSet<FichaInscripcion> fichasInsc){
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
		if(admin == null) {
			System.out.println("admin null")
		}
		if(admin.homePartidos == null) {
			System.out.println("home partidos null")
		}
		partidosDAO.getPartidosArmandose().elements().get(0)
		//admin.homePartidos.getPartidosArmandose().elements().get(0)
	} 
	
	/*private initEnviroment(){
	//	def partidito = admin.organizarPartido(10082014, 1830)
		def modoEstandar = new InscripcionEstandar()
		def i = 0 
    	while(i<10){
			def Socio s = new Socio("a" + i,22,"mail@" + i +".com.ar",admin)
			i=i+1
			s.handicap = i 
    		s.inscribirseA(partidito,modoEstandar)
			
    	}*/
		
//		mapaModosDivision = new HashMap<String, ModoDivision>()
//		mapaModosDivision.put("Par/Impar", new DivisionParImpar())
//		mapaModosDivision.put("1,4,5,8,9", new DivisionEspecifica())
//		
//		mapaCriteriosOrden = new HashMap<String, Criterio>()
//		mapaCriteriosOrden.put("Handicap", new CriterioPorHandicap() )
//		mapaCriteriosOrden.put("Promedio calificaciones ultimo partido", new CalificacionesUltimoPartido())
//		mapaCriteriosOrden.put("Criterio Mixto", new CriterioMix())
//		mapaCriteriosOrden.put("Promedio calificaciones ultimos n partidos", new UltimasCalificaciones())
//	}
	
}
