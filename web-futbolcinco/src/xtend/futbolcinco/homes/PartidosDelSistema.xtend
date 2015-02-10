package futbolcinco.homes

import dtos.SocioDTO
import futbolcinco.FichaInscripcion
import futbolcinco.Partido
import java.util.ArrayList
import java.util.List
import org.hibernate.HibernateException
import org.hibernate.criterion.Restrictions

class PartidosDelSistema extends AbstractHomeSQL<Partido> {
	
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
//		try {
			session.beginTransaction
			partido.equipo1.integrantes.add(ficha)
//			ficha.equipo = partido.equipo1
			session.saveOrUpdate(ficha)
			session.saveOrUpdate(partido)
			session.getTransaction.commit
//		} 
//		catch (HibernateException e) {
//			println("Se rollbackeo agregar al equipo 1 : " + e.message)
//			session.getTransaction.rollback
//		} 
//		finally {
			session.close
//		}
	}
	
	def agregarInscriptoAEquipo2(Partido partido, FichaInscripcion ficha) {
		val session = sessionFactory.openSession
//		try {
			session.beginTransaction
			partido.equipo2.integrantes.add(ficha)
//			ficha.equipo = partido.equipo2
			session.saveOrUpdate(ficha)
			session.saveOrUpdate(partido)
			session.getTransaction.commit
//		} 
//		catch (HibernateException e) {
//			println("Se rollbackeo agregar al equipo 2 : " + e.message)
//			session.getTransaction.rollback
//		} 
//		finally {
			session.close
//		}
	}
	
	def List<SocioDTO> getListaSociosDTOEquipo1(Partido partido) {
		val session = sessionFactory.openSession
		var listaDTOs = new ArrayList<SocioDTO>
		try {
			session.beginTransaction
			val fichas = partido.equipo1.integrantes
			for( FichaInscripcion ficha : fichas) { 
				listaDTOs.add(new SocioDTO(ficha.inscripto))
			}
			session.getTransaction.commit
		}
		catch(HibernateException e) {
			println("Se rollbackeo obtener DTOS equipo 1 : " + e.message)
			session.getTransaction.rollback
		}
		finally {
			session.close
		}
		return listaDTOs
	}
	
	def List<SocioDTO> getListaSociosDTOEquipo2(Partido partido) {
		val session = sessionFactory.openSession
		var listaDTOs = new ArrayList<SocioDTO>
		try {
			session.beginTransaction
			val fichas = partido.equipo2.integrantes
			for( FichaInscripcion ficha : fichas) { 
				listaDTOs.add(new SocioDTO(ficha.inscripto))
			}
			session.getTransaction.commit
		}
		catch(HibernateException e) {
			println("Se rollbackeo obtener DTOS equipo 2 : " + e.message)
			session.getTransaction.rollback
		}
		finally {
			session.close
		}
		return listaDTOs
	}
	
	def buscarPartido(Long id) { 
		val session = sessionFactory.openSession
		val criteria = session.createCriteria(Partido).add(Restrictions.eq("_id",id));
		val result = criteria.uniqueResult  as Partido;
		session.close
		return result

	}
}