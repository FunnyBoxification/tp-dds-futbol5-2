package futbolcinco.homes

import futbolcinco.Socio
import java.util.ArrayList
import java.util.LinkedList
import java.util.List
import org.hibernate.criterion.Restrictions

class SociosDelSistema extends AbstractHomeSQL<Socio> {
	
	private static SociosDelSistema instance
	
	def static instance() {
		if(instance == null) { 
			instance = new SociosDelSistema
			return instance
		}
		else return instance
	}
	
	def buscarPorId(String idStr) {
		val id = new Long(idStr)
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio).add(Restrictions.eq("_id",id));
		val result = criteria.uniqueResult  as Socio;
		session.close
		return result
	}
	
	def List<Socio> buscarPorNombre(String nombre) {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio).add(Restrictions.eq("_nombre",nombre))		
		val result = criteria.list()
		session.close
		return result
	}
	
	def List<Socio> buscarPorEdad(Integer edad) {
		val session = sessionFactory.openSession
//		.createAlias("_materias", "materias")
//				.add(Restrictions.eq("materias.id", materia.id))
		val criteria = session.createCriteria(Socio).add(Restrictions.le("_edad",edad))
		val result = criteria.list()// as LinkedList<Socio>
		session.close
		return result
		/*
		val criteria = [ Socio socio | socio.edad <= edad]
		return this.getByCriterio(criteria)
		*/
	}
	
	def List<Socio> buscarPorHandicapDesde(Integer handicap) {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio).add(Restrictions.ge("_handicap",handicap))
		val result = criteria.list()
		session.close
		return result
		/*
		val criteria = [ Socio socio | socio.handicap >= handicap]
		return this.getByCriterio(criteria)
		*/
	}
	
	def List<Socio> buscarPorHandicapHasta(Integer handicap) {
		
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio).add(Restrictions.le("_handicap",handicap))
		val result = criteria.list()
		session.close
		return result
		/*
		val criteria = [ Socio socio | socio.handicap <= handicap]
		return this.getByCriterio(criteria)
		*/
	}
	
	def List<Socio> buscarPorPromedioLastMatchDesde(Double promedio) {
		if(promedio == 0.0) { 
			val session = sessionFactory.openSession
			val criteria = session.createCriteria(Socio)
			val result = criteria.list() 
			session.close
			return result
		}
		else return new ArrayList<Socio>
	}
	
	def List<Socio> buscarPorPromedioLastMatchHasta(Double promedio) {
		if(promedio > 0.0) { 
			val session = sessionFactory.openSession
			val criteria = session.createCriteria(Socio)
			val result = criteria.list() 
			session.close
			return result
		}
		else return new ArrayList<Socio>
	}
	
	def List<Socio> buscarSinInfracciones() {
		
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio).add(Restrictions.isEmpty("_infracciones")) //CHEQUEAR
		val result = criteria.list() 
		session.close
		return result
	}
	
	def List<Socio> buscarConInfracciones() {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio).add(Restrictions.isNotEmpty("_infracciones")) //CHEQUEAR
		val result = criteria.list() 
		session.close
		return result
	}
	
	override elements() {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Socio)
		val result = criteria.list() 
		session.close
		return result
	}
	
	override contiene(Socio socio) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(Socio).add(
			Restrictions.eq("_id",socio.id)
		)
		val result = criteria.uniqueResult as Socio 
		return result != null
	}
	
}