package futbolcinco.homes

import futbolcinco.FichaInscripcion
import futbolcinco.Partido
import org.hibernate.HibernateException
import org.hibernate.criterion.Restrictions

//TODO: Cuando se use mmongo hay que usar el otro home no el ClasesDePartidos
class PartidosDelSistema extends AbstractHomeSQL<Partido> {
//	@Property ClasesDePartidos partidosJugados
//	@Property ClasesDePartidos partidosListosParaJugar 
//	@Property ClasesDePartidos partidosArmandose
	
	private static PartidosDelSistema instance
	
	new() {
		
	}
	
	def static instance() {
		if(instance != null)
			instance
		else {
			instance = new PartidosDelSistema
		 	instance
		 }
	}
	
	override contiene(Partido elem) {
		val session = sessionFactory.openSession
		//Con buscar solo por id creo que es suficiente, no creo que haya que hacer un search by example muy profundo...
		val criteria = session.createCriteria(Partido).add(
			Restrictions.eq("_id",elem.id)
		)
		val result = criteria.uniqueResult as Partido 
		return result != null
	}
	
	override elements() {
		val session = sessionFactory.openSession
		session.beginTransaction
		val criteria = session.createCriteria(Partido)
		val result = criteria.list() //as LinkedList<Partido>
		session.close
		return result	
	}
	
	def agregarInscriptoAEquipo1(Partido partido, FichaInscripcion ficha) { 
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			partido.equipo1.integrantes.add(ficha)
			ficha.equipo = partido.equipo1
			session.saveOrUpdate(ficha)
			session.saveOrUpdate(partido)
			session.getTransaction.commit
		} 
		catch (HibernateException e) {
			println("Se rollbackeo agregar al equipo 1 : " + e.message)
			session.getTransaction.rollback
		} 
		finally {
			session.close
		}
	}
	
	def agregarInscriptoAEquipo2(Partido partido, FichaInscripcion ficha) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			partido.equipo2.integrantes.add(ficha)
			ficha.equipo = partido.equipo2
			session.saveOrUpdate(partido)
			session.getTransaction.commit
		} 
		catch (HibernateException e) {
			println("Se rollbackeo agregar al equipo 2 : " + e.message)
			session.getTransaction.rollback
		} 
		finally {
			session.close
		}
	}
	
	def buscarPartido(Long id) { 
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Partido).add(Restrictions.eq("_id",id));
		val result = criteria.uniqueResult  as Partido;
		session.close
		return result
		/*
		val criteria = [ Socio socio | socio.nombre.equals(id)]
		return this.getByCriterio(criteria).get(0)*/
	}
}