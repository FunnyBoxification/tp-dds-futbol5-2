package futbolcinco

import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.JoinColumn
import javax.persistence.ManyToOne
import javax.persistence.OneToMany
import javax.persistence.Table
import javax.persistence.Transient
import observers.ModificacionObserver
import org.hibernate.annotations.Where

@Entity 
@Table (name="partidos")
//@SecondaryTable(name="partidos_inscripciones") //Para los equipos
class Partido {
	@Id
	@GeneratedValue
	@Property Long id
	
	@Property Integer dia
	
	@Property Integer hora
	
	@Property int estado
	
	@OneToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	List<FichaInscripcion> inscriptos
	
	@ManyToOne
	@Property Administrador admin
	
	@Transient
	@Property List<ModificacionObserver> inscripcionObservers
	
	@Transient
	@Property List<ModificacionObserver> desInscripcionObservers
	
	@Transient
	@Property List<ModificacionObserver> remplazoObservers
	
	@Transient //Por ahora
	@Property Set<Calificacion> calificaciones
	
	
	@ManyToOne(fetch = FetchType.LAZY) //(mappedBy = "partido")
	@JoinColumn(name="equipo1_fk")
	@Where(clause = "numeroEquipo = 1")
	@Property Equipo equipo1
	
	@ManyToOne(fetch = FetchType.LAZY) //(mappedBy = "partido")
	@JoinColumn(name="equipo2_fk")
	@Where(clause = "numeroEquipo = 2")
	@Property Equipo equipo2
	 
	/************************************************************************* */
	new() {
		
	}
	new (Integer dia, Integer hora, Administrador admin) {
		this.dia = dia
		this.hora = hora
		this.inscriptos = new ArrayList<FichaInscripcion>
		this.admin = admin
		//Home.partidosArmandose.add(this)
		inscripcionObservers = new ArrayList<ModificacionObserver>
		desInscripcionObservers = new ArrayList<ModificacionObserver>
		remplazoObservers = new ArrayList<ModificacionObserver>
		calificaciones = new HashSet<Calificacion>
		equipo1 = new Equipo
		equipo2 = new Equipo
		estado = ConstantesEnum.PARTIDO_ARMANDOSE
	}
	
	def Equipo getEquipo1() {
		this._equipo1
	}
	
	def void setEquipo1(Equipo equi) {
//		System.out.println("El equipo 1 del partido del " + dia + " : " + hora + "es : " + equi.toString)
		this._equipo1 = equi
	}
	
	def Equipo getEquipo2() {
		this._equipo2
	}
	
	def void setEquipo2(Equipo equi) {
		this._equipo2 = equi
	}
	
	def List<FichaInscripcion> getInscriptos() {
		return inscriptos
	}
	
	def void setInscriptos(List<FichaInscripcion> lista) {
		inscriptos = lista
	}
	
	def void agregarInscripcionObserver(ModificacionObserver inscripcionObserver){
 		inscripcionObservers.add(inscripcionObserver)
 }
 	def void agregarDesInscripcionObserver(ModificacionObserver inscripcionObserver){
 		desInscripcionObservers.add(inscripcionObserver)
 }
 	def void agregarRemplazoObserver(ModificacionObserver inscripcionObserver){
 		remplazoObservers.add(inscripcionObserver)
 }
 
 
 	/////notifica a lista de inscriptos///////
 	def void notificaInscripto(Socio interesado){
 		inscripcionObservers.forEach [sender | sender.send(interesado,this)] 
 	}
 	/////notifica a lista de desinscriptos///////
 	def void notificaDesInscripto(Socio interesado){
 		desInscripcionObservers.forEach [sender | sender.send(interesado,this)] 
 	}
 	/////notifica a lista de remplazos///////
 	def void notificaRemplazo(Socio interesado){
 		remplazoObservers.forEach [sender | sender.send(interesado,this)] 
 	}
 
 ////desinscribir y remplazo////
	def void remplazame(Socio interesado,FichaInscripcion ficha){
		this.inscriptos.remove(this.getInscriptos.findFirst[fichaInsc | fichaInsc.inscripto == interesado ])
		this.getInscriptos.add(ficha)
		
		this.notificaRemplazo(ficha.inscripto)
	}
	
	def void desinscribirA(Socio interesado){
		this.notificaDesInscripto(interesado)
		this.inscriptos.remove(this.getInscriptos.findFirst[ficha | ficha.inscripto == interesado ])
		
		}
	
	
	


	
	
	
	
	
	def boolean todosEstandares() {
		inscriptos.forall[ inscripto | inscripto.modoInscripcion.esEstandar ] && inscriptos.size == 10
	}
	
	def inscriptosCondicionales() {
		inscriptos.filter[inscripto | inscripto.modoInscripcion.esCondicional ]
	}
	
	
	def void sacarCondMal(FichaInscripcion ficha){
		
		 if(ficha.modoInscripcion.esCondicional() && !ficha.condicion.cumplePara(this)) {
			this.getInscriptos.remove(ficha)
			
		}
		
	}
	
	/*def void cerrar(){
		  cerrado = true 
		
	}
	def void abrir(){
		cerrado = false
	}*/
	
	/*DAFUK def boolean estaCompleto(){
		val filtro = this.getInscriptos.filter[ficha | !ficha.modoInscripcion.esCondicional ]
		val filtro2 = filtro.filter[ficha | !ficha.modoInscripcion.esSolidaria ]
		filtro2.size == 10
	}*/
	
	def agregarCalificacion(Partido partido, Socio calificado, Socio calificador, Integer nota, String opinion) {
		this.devolveMiFicha(calificado).calificaciones.add(new Calificacion(partido,calificador,nota,opinion))
	}
	

	def FichaInscripcion devolveMiFicha(Socio jugador){
		this.getInscriptos.findFirst[ficha|ficha.inscripto == jugador]
	}	
	
	
	def void agregarAEquipo1(FichaInscripcion ficha){
		this.equipo1.integrantes.add(ficha)
		
	}
	def void agregarAEquipo2(FichaInscripcion ficha){
		this.equipo2.integrantes.add(ficha)
		
	}
}

