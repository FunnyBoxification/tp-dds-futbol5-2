package futbolcinco.homes

import futbolcinco.Administrador
import java.util.LinkedList
import org.hibernate.criterion.Restrictions

class AdministradoresDelSistema extends AbstractHomeSQL<Administrador> {
	
	private static AdministradoresDelSistema instance
	
	/**
	 * Falta que cuando obtenga el admin le setee los homes que usa
	 */
	def getByMail(String casilla) {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Administrador).add(Restrictions.eq("_casilla",casilla))
		val result = criteria.uniqueResult
		return result
		
	}
	
	override elements() {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Administrador)
		val result = criteria.list() as LinkedList<Administrador>
		session.close
		return result
	}
	
	override contiene(Administrador admin) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(Administrador).add(
			Restrictions.eq("_id",admin.id)
		)
		val result = criteria.uniqueResult as Administrador 
		return result != null
	}
	
	def static instance() {
		if(instance == null) { 
			instance = new AdministradoresDelSistema
			return instance
		}
		else return instance
	}
	
}