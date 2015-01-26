package futbolcinco.homes

import futbolcinco.Partido
import java.util.LinkedList
import org.hibernate.criterion.Restrictions

class ClasesDePartidosSQL extends AbstractHomeSQL<Partido> implements ClasesDePartidos {
	
	private static ClasesDePartidosSQL instance
	
	def static instance() {
		if(instance == null) { 
			instance = new ClasesDePartidosSQL
			return instance
		}
		else return instance
	}
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(Partido)
		val result = criteria.list() //as LinkedList<Partido>
		session.close
		return result
	}
	
	override contiene(Partido partido) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(Partido).add(
			Restrictions.eq("_id",partido.id)
		)
		val result = criteria.uniqueResult as Partido 
		return result != null
	}
	
	
}
