package futbolcinco.homes

import futbolcinco.Socio
import java.util.LinkedList

class SociosDelSistema extends AbstractHome<Socio> {
	
	private static SociosDelSistema instance
	
	def static instance() {
		if(instance == null) 
			return new SociosDelSistema
		else return instance
	}
	
	def LinkedList<Socio> buscarPorNombre(String nombre) {
		val criteria = [ Socio socio | socio.nombre.startsWith(nombre)]
		return this.getByCriterio(criteria)
	}
	
	def LinkedList<Socio> buscarPorEdad(Integer edad) {
		val criteria = [ Socio socio | socio.edad <= edad]
		return this.getByCriterio(criteria)
	}
	
	def LinkedList<Socio> buscarPorHandicapDesde(Integer handicap) {
		val criteria = [ Socio socio | socio.handicap >= handicap]
		return this.getByCriterio(criteria)
	}
	
	def LinkedList<Socio> buscarPorHandicapHasta(Integer handicap) {
		val criteria = [ Socio socio | socio.handicap <= handicap]
		return this.getByCriterio(criteria)
	}
	
	def LinkedList<Socio> buscarPorPromedioLastMatchDesde(Double promedio) {
//		hacer
	}
	
	def LinkedList<Socio> buscarPorPromedioLastMatchHasta(Double promedio) {
//		hacer
	}
	
	def LinkedList<Socio> buscarSinInfracciones() {
		this.getByCriterio([ Socio socio | socio.infracciones.isEmpty])
	}
	
	def LinkedList<Socio> buscarConInfracciones() {
		this.getByCriterio( [ Socio socio | !socio.infracciones.isEmpty])
	}
}