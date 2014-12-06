package futbolcinco.homes

import futbolcinco.JugadorPropuesto
import java.util.LinkedList
import org.hibernate.criterion.Restrictions

class JugadoresPropuestosDelSistema extends AbstractHomeSQL<JugadorPropuesto> {
	
	private static JugadoresPropuestosDelSistema instance
	
	def static instance() {
		if(instance == null) { 
			instance = new JugadoresPropuestosDelSistema
			return instance
		}
		else return instance
	}
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(JugadorPropuesto)
		val result = criteria.list() as LinkedList<JugadorPropuesto>
		session.close
		return result
	}
	
	override contiene(JugadorPropuesto jugador) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(JugadorPropuesto).add(
			Restrictions.eq("_id",jugador.id)
		)
		val result = criteria.uniqueResult as JugadorPropuesto 
		return result != null
	}
	
}