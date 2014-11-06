package futbolcinco.homes

import futbolcinco.JugadorDenegado
import java.util.LinkedList

class JugadoresDenegadosDelSistema extends AbstractHome<JugadorDenegado>{
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(JugadorDenegado)
		val result = criteria.list() as LinkedList<JugadorDenegado>
		session.close
		return result
	}
	
}