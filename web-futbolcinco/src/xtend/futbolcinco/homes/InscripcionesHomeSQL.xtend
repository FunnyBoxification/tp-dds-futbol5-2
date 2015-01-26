package futbolcinco.homes

import futbolcinco.FichaInscripcion
import org.hibernate.criterion.Restrictions

class InscripcionesHomeSQL extends AbstractHomeSQL<FichaInscripcion> {
	
	override elements() {
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(FichaInscripcion)
		val result = criteria.list() 
		session.close
		return result
	}
	
	override contiene(FichaInscripcion elem) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(FichaInscripcion).add(
			Restrictions.eq("_id",elem.id)
		)
		val result = criteria.uniqueResult as FichaInscripcion 
		return result != null
	}
	
}