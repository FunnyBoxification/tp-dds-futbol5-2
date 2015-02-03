package futbolcinco

import Exceptions.PartidoCerradoException
import Exceptions.PartidoIncompletoException
import Exceptions.PartidoNoListoException
import Exceptions.PropuestoNoEncontradoException
import Exceptions.SocioInexistenteException
import command.Criterio
import futbolcinco.homes.AbstractHomeSQL
import futbolcinco.homes.JugadoresDenegadosDelSistema
import futbolcinco.homes.JugadoresPropuestosDelSistema
import futbolcinco.homes.PartidosDelSistema
import futbolcinco.homes.SociosDelSistema
import java.util.Calendar
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Transient
import strategy.ModoDivision

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
	@Property AbstractHomeSQL<JugadorDenegado> homeJugadoresDenegados

	@Transient	
	@Property AbstractHomeSQL<JugadorPropuesto> homeJugadoresPropuestos
	
	@Transient
	@Property AbstractHomeSQL<Socio> homeSocios
	
	/*********************************************************************************************** */
	new() {
		
	}
	new(String mail){
		this.casilla = mail
		this.homeJugadoresPropuestos = new JugadoresPropuestosDelSistema
		this.homeJugadoresDenegados = new JugadoresDenegadosDelSistema
		this.homePartidos = PartidosDelSistema.instance()
		this.homeSocios = SociosDelSistema.instance
	}
	
	def Partido organizarPartido(Integer dia, Integer hora) {
		var part = new Partido(dia,hora,this)
		//homePartidos.partidosArmandose.agregarOActualizar(part)
//		part.estado = ConstantesEnum.PARTIDO_ARMANDOSE;
		//TODO: Cambiar el home de partidos ya que no tendria que haber un home por estados de partidos
		homePartidos.agregarOActualizar(part)
		return part
	}
	
	
 	///////////  altas de socios ///////////
 	def Socio aceptarPropuesto(JugadorPropuesto jugador){
 		if(homeJugadoresPropuestos.contiene(jugador)) {
 			 		var socio = new Socio(jugador.nombre, jugador.edad, jugador.casilla, this)
 			 		homeJugadoresPropuestos.sacar(jugador)
 					homeSocios.agregarOActualizar(socio)
 					return socio
 			
 		}
 		else throw new PropuestoNoEncontradoException	
 	}
 	
 	def void denegarPropuesto(JugadorPropuesto jugador,String motivo){
 		if(homeJugadoresPropuestos.contiene(jugador)) {
 			val fecha = Calendar.getInstance.get(Calendar.DAY_OF_MONTH) * 1000000 + 
 							( (Calendar.getInstance.get(Calendar.MONTH) +1) * 10000) + Calendar.getInstance.get(Calendar.YEAR)
 			homeJugadoresDenegados.agregarOActualizar(new JugadorDenegado(jugador,motivo, fecha))
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
 		if(partido.estado == ConstantesEnum.PARTIDO_ARMANDOSE) {
 			var falsoPartido = partido
 			falsoPartido.inscriptos.forEach [inscripto | criterio.aplicarCriterio(inscripto)]
 			falsoPartido.inscriptos = falsoPartido.inscriptos.sortBy[ ponderacion ]
 			falsoPartido
 		}
 	}
 	
 	////////////////////divisionDePartidos////////////////////////
 	def Partido hacerDivision(Partido partido, ModoDivision modoDivision){
 		//Persisto el partido por si se encuentre en estado detached
 		PartidosDelSistema.instance().agregarOActualizar(partido)
 		if(partido.getInscriptos.size!=10){
 			System.out.println("Cantidad Inscriptos: "+ partido.getInscriptos.size)
 			throw new PartidoIncompletoException
 		}
// 		if(!homePartidos.partidosArmandose.contiene(partido)){
		if(partido.estado != ConstantesEnum.PARTIDO_ARMANDOSE) {
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
// 		if(homePartidos.partidosArmandose.contiene(partidoViejo)){
// 			homePartidos.partidosArmandose.sacar(partidoViejo)
// 			homePartidos.partidosListosParaJugar.agregarOActualizar(dividido)
// 			dividido //todojunto

		if(partidoViejo.estado == ConstantesEnum.PARTIDO_ARMANDOSE) {
			dividido.estado = ConstantesEnum.PARTIDO_LISTO
			homePartidos.agregarOActualizar(dividido)
 			dividido //todojunto
 		}else{
 			throw new PartidoCerradoException
 		}
 	}
 	
 	def void jugarPartido(Partido partido){
// 		if(!homePartidos.partidosListosParaJugar.contiene(partido)){
		if(partido.estado != ConstantesEnum.PARTIDO_LISTO) {
 			throw new PartidoNoListoException	
 		} //debería tener una nueva exception
 		if(partido.equipo1.integrantes.size != 5 || partido.equipo2.integrantes.size != 5) {
 			throw new PartidoIncompletoException	
 		}
// 		homePartidos.partidosListosParaJugar.sacar(partido)
		partido.estado = ConstantesEnum.PARTIDO_JUGADO
		//TODO: CAMBIAR
 		homePartidos.agregarOActualizar(partido)
 		
 		
 	}
 	
		
}
 	//confirmarpartido(viejo,Hascerdivision(Ponercriterio(asdasd)))
 	
 	