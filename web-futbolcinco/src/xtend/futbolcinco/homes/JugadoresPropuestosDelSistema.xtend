package futbolcinco.homes

import futbolcinco.JugadorPropuesto
import java.util.LinkedList

class JugadoresPropuestosDelSistema extends AbstractHome<JugadorPropuesto> {
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(JugadorPropuesto)
		val result = criteria.list() as LinkedList<JugadorPropuesto>
		session.close
		return result
	}
	
}