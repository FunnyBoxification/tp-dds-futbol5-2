package futbolcinco

import java.util.LinkedList
import org.eclipse.xtend.lib.Property

class FichaInscripcion {
	@Property Socio inscripto
	@Property ModoInscripcion modoInscripcion
	@Property Condicion condicion
	@Property LinkedList<Calificacion> calificaciones	
	@Property double ponderacion
	//@Property int handicap
	
	new(Socio jugador, ModoInscripcion modo, Condicion condicion){
		this.inscripto = jugador
		this.modoInscripcion = modo
		this.condicion = condicion
		this.calificaciones = new LinkedList<Calificacion>
		this.ponderacion = 5.5
	}
	new(Socio jugador, ModoInscripcion modo){
		this.inscripto = jugador
		this.modoInscripcion = modo
		this.condicion = null
		this.calificaciones = new LinkedList<Calificacion>
	}
}