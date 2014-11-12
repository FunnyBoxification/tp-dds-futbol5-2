package futbolcinco

import Exceptions.PartidoCerradoException
import Exceptions.PartidoIncompletoException
import Exceptions.PartidoNoListoException
import Exceptions.PropuestoNoEncontradoException
import Exceptions.SocioInexistenteException
import command.Criterio
import futbolcinco.homes.AbstractHome
import futbolcinco.homes.JugadoresDenegadosDelSistema
import futbolcinco.homes.JugadoresPropuestosDelSistema
import futbolcinco.homes.PartidosDelSistema
import futbolcinco.homes.SociosDelSistema
import java.util.Calendar
import org.eclipse.xtend.lib.Property
import strategy.ModoDivision
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Column
import javax.persistence.Transient

@Entity 
class Administrador {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	@Column
	@Property String casilla
	
	/******************************************************************************************
	 * 
	 * 					
	 */
	
	@Transient
	@Property PartidosDelSistema homePartidos
	
	@Transient
	@Property AbstractHome<JugadorDenegado> homeJugadoresDenegados

	@Transient	
	@Property AbstractHome<JugadorPropuesto> homeJugadoresPropuestos
	
	@Transient
	@Property AbstractHome<Socio> homeSocios
	
	/*********************************************************************************************** */
	new() {
		
	}
	new(String mail){
		this.casilla = mail
		this.homeJugadoresPropuestos = new JugadoresPropuestosDelSistema
		this.homeJugadoresDenegados = new JugadoresDenegadosDelSistema
		this.homePartidos = new PartidosDelSistema
		this.homeSocios = new SociosDelSistema
	}
	
	def Partido organizarPartido(Integer dia, Integer hora) {
		var part = new Partido(dia,hora,this)
		homePartidos.partidosArmandose.agregar(part)
		return part
	}
	
	
 	///////////  altas de socios ///////////
 	def Socio aceptarPropuesto(JugadorPropuesto jugador){
 		if(homeJugadoresPropuestos.contiene(jugador)) {
 			 		var socio = new Socio(jugador.nombre, jugador.edad, jugador.casilla, this)
 			 		homeJugadoresPropuestos.sacar(jugador)
 					homeSocios.agregar(socio)
 					return socio
 			
 		}
 		else throw new PropuestoNoEncontradoException	
 	}
 	
 	def void denegarPropuesto(JugadorPropuesto jugador,String motivo){
 		if(homeJugadoresPropuestos.contiene(jugador)) {
 			val fecha = Calendar.getInstance.get(Calendar.DAY_OF_MONTH) * 1000000 + 
 							( (Calendar.getInstance.get(Calendar.MONTH) +1) * 10000) + Calendar.getInstance.get(Calendar.YEAR)
 			homeJugadoresDenegados.agregar(new JugadorDenegado(jugador,motivo, fecha))
 			homeJugadoresPropuestos.sacar(jugador)
 		}
 		else throw new PropuestoNoEncontradoException
 	}
 
 	///////// Set handicap de un socio ////
 	def void setHandicap(Socio socio,Integer n) {
 		if(homeSocios.contiene(socio)) {
 			socio.handicap = n
 		}
 		else throw new SocioInexistenteException
 		
 	}
 	/////////// Orden //////////
 	def Partido ordenarJugadoresPorCriterio(Partido partido, Criterio criterio) {
 		if(homePartidos.partidosArmandose.contiene(partido)) {
 			var falsoPartido = partido
 			falsoPartido.inscriptos.forEach [inscripto | criterio.aplicarCriterio(inscripto)]
 			falsoPartido.inscriptos = falsoPartido.inscriptos.sortBy[ ponderacion ]
 			falsoPartido
 		}
 	}
 	
 	////////////////////divisionDePartidos////////////////////////
 	def Partido hacerDivision(Partido partido, ModoDivision modoDivision){
 		if(partido.getInscriptos.size!=10){
 			throw new PartidoIncompletoException
 		}
 		if(!homePartidos.partidosArmandose.contiene(partido)){
 			throw new PartidoCerradoException
 		}
 			var falsoPartido = partido
	 			modoDivision.definirDivision(falsoPartido)
 			falsoPartido
 	}
 	
 	
 	/*def void confirmarDivision(Partido partido){
 		
 		Home.partidosListosParaJugar.add(partido)
 		Home.partidosArmandose.remove(partido)
 		
 	}*/
 	
 	///////confirmarEquipos/////////////
 	def Partido confirmarEquipos(Partido partidoViejo, Partido dividido){
 		if(homePartidos.partidosArmandose.contiene(partidoViejo)){
 			homePartidos.partidosArmandose.sacar(partidoViejo)
 			homePartidos.partidosListosParaJugar.agregar(dividido)
 			dividido //todojunto
 		}else{
 			throw new PartidoCerradoException
 		}
 	}
 	
 	def void jugarPartido(Partido partido){
 		if(!homePartidos.partidosListosParaJugar.contiene(partido)){
 			throw new PartidoNoListoException	
 		} //debería tener una nueva exception
 		if (partido.equipo1.size != 5 || partido.equipo2.size != 5){
 			throw new PartidoIncompletoException	
 		}
 		homePartidos.partidosListosParaJugar.sacar(partido)
 		homePartidos.partidosJugados.agregar(partido)
 		
 		
 	}
 	
		
}
 	//confirmarpartido(viejo,Hascerdivision(Ponercriterio(asdasd)))
 	
 	