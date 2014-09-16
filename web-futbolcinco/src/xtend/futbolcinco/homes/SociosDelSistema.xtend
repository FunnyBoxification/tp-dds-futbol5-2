package futbolcinco.homes

import futbolcinco.Socio
import java.util.LinkedList

class SociosDelSistema extends AbstractHome<Socio> {
	
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
}