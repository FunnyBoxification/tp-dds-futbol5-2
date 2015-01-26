package futbolcinco.homes

import futbolcinco.ModoInscripcion
import org.hibernate.criterion.Restrictions

class ModoInscripcionHomeSQL extends AbstractHomeSQL<ModoInscripcion> {
	
	static ModoInscripcionHomeSQL instance
	
	def static instance() { 
		if(instance == null ) { 
			return new ModoInscripcionHomeSQL
		}
		else return instance
	}
		
		override elements() {
			val session = sessionFactory.openSession
		val criteria = session.createCriteria(ModoInscripcion)
		val result = criteria.list() 
		session.close
		return result
		}
		
		override contiene(ModoInscripcion elem) {
			val session = sessionFactory.openSession
			//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
			val criteria = session.createCriteria(ModoInscripcion).add(
				Restrictions.eq("_id",elem.id)
			)
			val result = criteria.uniqueResult as ModoInscripcion 
			return result != null
		}
	
}