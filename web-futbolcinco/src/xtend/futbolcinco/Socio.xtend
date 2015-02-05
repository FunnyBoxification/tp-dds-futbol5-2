package futbolcinco

import Exceptions.CalificacionRepetidaException
import Exceptions.CalificadoNoJugoEnElPartidoException
import Exceptions.CalificadorNoJugoEnElPartidoException
import Exceptions.NoInscriptoException
import Exceptions.NoSePuedeCalificarASiMismoException
import Exceptions.PartidoCerradoException
import Exceptions.PartidoCompletoException
import Exceptions.PartidoNoJugadoException
import Exceptions.PuntuacionIncorrectaException
import futbolcinco.homes.PartidosDelSistema
import java.util.HashSet
import java.util.LinkedList
import java.util.List
import java.util.Set
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id

@Entity
class Socio {

	@Id
	@Property ObjectId id
	
	@Property String nombre
	
	@Property Integer edad
	
	@Property String casilla
	
	@Property Set<Partido> inscripciones
	
	@Property Set<Socio> amigos
	
	Set<Socio> amigoDe
	
	@Property List<Infraccion> infracciones
	
	//////////////////////////////////////////////////////////////////////////
	/*
	 * 	Estaria bueno que alguno me diga como piensan mapear esta negrada
	 */
	@Property LinkedList<Calificacion> misCalificaciones
	
	@Property HashSet<Calificacion> calificacionesHechas
	
	//////////////////////////////////////////////////////////////////////////
	
	@Property Integer handicap
	
	@Property LinkedList<Partido> misPartidos
	
	@Property PartidosDelSistema homePartidos //NO ESTOY SEGURO DE ESTO, CONSULTAR. PUEDE TENER ADMIN O OTRA COSA
	
	
	// Hibernate necesita un constructor vacio
	new() {
//		this.homePartidos = PartidosDelSistema.instance()
	}
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
//		System.out.println(PartidosDelSistema.instance().toString)
//		System.out.println(PartidosDelSistema.instance().partidosArmandose.toString)
//		if(PartidosDelSistema.instance().partidosArmandose == null) { 
//			System.out.println("el home de partidos armandose esta vacio")
//		}
//		if(PartidosDelSistema.instance().partidosArmandose.contiene(partido)){
		if(partido.estado != ConstantesEnum.PARTIDO_ARMANDOSE ) {
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
		if(partido.estado != ConstantesEnum.PARTIDO_ARMANDOSE){
			throw new PartidoCerradoException
		}
		partido.desinscribirA(this)	
	}
	
	
	def void remplazameEn(Partido partido,Socio remplazo,ModoInscripcion modoInscripcion, (Partido)=>boolean condicion ){
		if(!partido.getInscriptos.exists[ficha | ficha.inscripto==this ]){
			throw new NoInscriptoException 
			}
		if(partido.estado != ConstantesEnum.PARTIDO_ARMANDOSE){
			throw new PartidoCerradoException
		}
		var ficha = new FichaInscripcion(remplazo,modoInscripcion,null,partido)
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
		admin.homeJugadoresPropuestos.agregarOActualizar(amigo)
	}
	
	
	////////////////////calificaciones/////////////////	
	def void calificar(Partido partido, Socio socio, Integer nota, String opinion){
		
		if(partido.estado != ConstantesEnum.PARTIDO_JUGADO){
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



//////////////ObtenerPromedios

	def getPromedio(){
		 var a = 0.0
		 if(misCalificaciones != null) {
			 if(misCalificaciones.isEmpty()) 
			 	return 0.0
			 for(Calificacion calificacion : misCalificaciones)	 {
			 	a += calificacion.puntaje
			 }
			 return a/misCalificaciones.size()
		 }
		 else return a;
	}
}