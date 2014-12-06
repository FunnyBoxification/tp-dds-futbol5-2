package futbolcinco.homes

import futbolcinco.JugadorDenegado
import java.util.LinkedList
import org.hibernate.criterion.Restrictions

class JugadoresDenegadosDelSistema extends AbstractHomeSQL<JugadorDenegado>{
	
	private static JugadoresDenegadosDelSistema instance
	
	def static instance() {
		if(instance == null) { 
			instance = new JugadoresDenegadosDelSistema
			return instance
		}
		else return instance
	}
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(JugadorDenegado)
		val result = criteria.list() as LinkedList<JugadorDenegado>
		session.close
		return result
	}
	
	override contiene(JugadorDenegado jugador) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(JugadorDenegado).add(
			Restrictions.eq("_id",jugador.id)
		)
		val result = criteria.uniqueResult as JugadorDenegado 
		return result != null
	}
	
}