package futbolcinco.homes

import futbolcinco.Partido
import java.util.LinkedList

class ClasesDePartidos extends AbstractHome<Partido>  {
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(Partido)
		val result = criteria.list() as LinkedList<Partido>
		session.close
		return result
	}
	
}
