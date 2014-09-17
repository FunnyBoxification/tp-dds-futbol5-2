package futbolcinco

import java.util.LinkedList
import java.util.Set
import java.util.HashSet
import Exceptions.PartidoCompletoException
import futbolcinco.JugadorPropuesto

import Exceptions.NoInscriptoExceptionimport Exceptions.CalificacionRepetidaException
import Exceptions.CalificadorNoJugoEnElPartidoException
import Exceptions.CalificadoNoJugoEnElPartidoException
import Exceptions.NoSePuedeCalificarASiMismoException
import Exceptions.PartidoNoJugadoException
import Exceptions.PuntuacionIncorrectaException
import Exceptions.PartidoCerradoException
import futbolcinco.homes.PartidosDelSistema

class Socio {
	@Property String id
	@Property String nombre
	@Property Integer edad
	@Property String casilla
	@Property Set<Partido> inscripciones
	@Property Set<Socio> amigos
	@Property LinkedList<Infraccion> infracciones
	@Property LinkedList<Calificacion> misCalificaciones	
	@Property HashSet<Calificacion> calificacionesHechas
	@Property Integer handicap
	@Property LinkedList<Partido> misPartidos
	@Property PartidosDelSistema homePartidos //NO ESTOY SEGURO DE ESTO, CONSULTAR. PUEDE TENER ADMIN O OTRA COSA
	
	new (String nombre,Integer anios,String mail,Administrador admin){
		this.nombre = nombre
		this.edad = anios
		this.casilla = mail
		this.inscripciones = new HashSet<Partido>
		this.amigos = new HashSet<Socio>
		this.infracciones = new LinkedList<Infraccion>	
		this.misPartidos = new LinkedList<Partido>
		this.misCalificaciones = new LinkedList<Calificacion>
		this.calificacionesHechas = new HashSet<Calificacion>
		this.handicap = 5
		this.homePartidos = admin.homePartidos
	}
	
	/*new(JugadorPropuesto jugador){
		new Socio(jugador.nombre,jugador.edad,jugador.casilla,)
	}*/
	
//////////////ModificacionesEnPartidos//////////////////
	def void inscribirseA(Partido partido,ModoInscripcion modoInscripcion, (Partido)=>boolean condicion) {
		if(partido.todosEstandares()) {
			throw new PartidoCompletoException
		}
		if(!homePartidos.partidosArmandose.contiene(partido)){
			throw new PartidoCerradoException
		}
		
			modoInscripcion.inscribirA(this, partido, condicion)
			inscripciones.add(partido)
		
	}
	
	def void inscribirseA(Partido partido,ModoInscripcion modoInscripcion){
		this.inscribirseA(partido,modoInscripcion,null)
	}
	
	
	def void desinscribirseA(Partido partido){
		if(!partido.getInscriptos.exists[ficha | ficha.inscripto==this ]){
			throw new NoInscriptoException 
		}
		if(!homePartidos.partidosArmandose.contiene(partido)){
			throw new PartidoCerradoException
		}
		partido.desinscribirA(this)	
	}
	
	
	def void remplazameEn(Partido partido,Socio remplazo,ModoInscripcion modoInscripcion, (Partido)=>boolean condicion ){
		if(!partido.getInscriptos.exists[ficha | ficha.inscripto==this ]){
			throw new NoInscriptoException 
			}
		if(!homePartidos.partidosArmandose.contiene(partido)){
			throw new PartidoCerradoException
		}
		var ficha = new FichaInscripcion(remplazo,modoInscripcion,null)
		partido.remplazame(this,ficha)
	}
	
	def void remplazameEn(Partido partido,Socio remplazo,ModoInscripcion modoInscripcion){
		this.remplazameEn(partido,remplazo,modoInscripcion,null)
	}
	
	
	//////////Infraccion//////////////
	def aplicarInfraccion(Integer desde, Integer hasta,String motivo) {
		this.infracciones.add(new Infraccion(desde,hasta,motivo))
	}
	
	/////////AñadirGente//////////////
	def void proponerAmigo(String nombre,Integer anios,String mail, Administrador admin){
		var amigo = new JugadorPropuesto(nombre,anios,mail)
		admin.homeJugadoresPropuestos.agregar(amigo)
	}
	
	
	////////////////////calificaciones/////////////////	
	def void calificar(Partido partido, Socio socio, Integer nota, String opinion){
		
		if(!homePartidos.partidosJugados.contiene(partido)){
			throw new PartidoNoJugadoException
		}else{
		if(this == socio){
			throw new NoSePuedeCalificarASiMismoException
		}else{
		if(!partido.inscriptos.exists(ficha | ficha.inscripto == socio)){
			throw new CalificadoNoJugoEnElPartidoException
		}else{
		if(!partido.inscriptos.exists(ficha | ficha.inscripto == this)){
			throw new CalificadorNoJugoEnElPartidoException
		}else{
		if(this.calificacionesHechas.exists(cal | cal.calificado == socio)){
			throw new CalificacionRepetidaException
		}else{
		if(nota<1 || nota>10){
			throw new PuntuacionIncorrectaException	
		}else{
			socio.agregarAMisCalificaciones(partido,this,socio,nota,opinion) 
			this.agregarACalificacionesHechas(partido,this,socio,nota,opinion)
			partido.agregarCalificacion(partido,socio,this,nota,opinion)
			}
	}}}}}
}
	
	def void agregarAMisCalificaciones(Partido partido, Socio unSocio, Socio otroSocio, Integer nota, String opinion) {
		otroSocio.misCalificaciones.add(new Calificacion(partido,unSocio,otroSocio,nota,opinion))
	}
	
	
	def void agregarACalificacionesHechas(Partido partido, Socio unSocio, Socio otroSocio, Integer nota, String opinion) {
		unSocio.calificacionesHechas.add(new Calificacion(partido,unSocio,otroSocio,nota,opinion))
	}
}
