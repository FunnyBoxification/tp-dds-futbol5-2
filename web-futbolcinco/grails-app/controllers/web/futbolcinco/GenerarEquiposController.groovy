package web.futbolcinco

import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;

import futbolcinco.Administrador
import futbolcinco.FichaInscripcion;
import futbolcinco.InscripcionEstandar
import futbolcinco.Partido
import futbolcinco.Socio
import strategy.DivisionEspecifica
import strategy.DivisionParImpar
import strategy.ModoDivision

class GenerarEquiposController {
	
	def static Administrador admin
	def static Map mapaModosDivision
	
    def index() { 
		redirect(action:"generarEquiposPag")
		admin = new Administrador("mail@prueba.com")
		initEnviroment();
	}
	
	def generarEquiposPag() {
		Partido p = conseguirPartidoEnHome()
		[partido:p]
	}
	
	def generarEquipos(){
	}
	
	/* FALTA HACER QUE ORDENE LOS JUGADORES ANTES DE DIVIDIRLOS */
	def solicitarEquipos(){
		Partido p = conseguirPartidoEnHome()
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
	
	private Partido conseguirPartidoEnHome(){
		admin._homePartidos.getPartidosArmandose().elements().get(0)
	} 
	
	private initEnviroment(){
		def partidito = admin.organizarPartido(10082014, 1830)
		def modoEstandar = new InscripcionEstandar()
		def i = 0 
    	while(i<10){
    		(new Socio("a" + i,22,"mail@" + i +".com.ar",admin).inscribirseA(partidito,modoEstandar))
			i=i+1
    	}
		
		mapaModosDivision = new HashMap<String, ModoDivision>()
		mapaModosDivision.put("Par/Impar", new DivisionParImpar())
		mapaModosDivision.put("1,4,5,8,9", new DivisionEspecifica())
	}
	
}
