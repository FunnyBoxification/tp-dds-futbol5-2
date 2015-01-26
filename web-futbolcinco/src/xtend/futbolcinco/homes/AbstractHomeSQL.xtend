package futbolcinco.homes

import futbolcinco.hibernate.util.HibernateUtil
import java.util.LinkedList
import java.util.List
import org.hibernate.HibernateException
import org.hibernate.SessionFactory

abstract class AbstractHomeSQL <T> implements AbstractHome<T>{
	private LinkedList<T> lista
		
	new(){
		lista = new LinkedList<T>
	}
	
	public static final SessionFactory sessionFactory = HibernateUtil.getSessionFactory()
		
	
	//TODO:Cambiar los getByCriterio por su version Hibernate
	@Deprecated 
	def List<T> getByCriterio((T)=>boolean criterio) {
		var listita = new LinkedList<T>
		for(T elem : lista) {
			if(criterio.apply(elem))
				listita.add(elem)
		}
		return listita
		//lista.filter [elem | criterio.apply(elem)] // as LinkedList<T>
	}
	
	@Deprecated
	def T damePrimero((T)=>boolean criterio) {
		lista.findFirst [elem | criterio.apply(elem)]
	}
	
	override void agregarOActualizar(T elem) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.saveOrUpdate(elem)
			session.getTransaction.commit
		} 
		catch (HibernateException e) {
			session.getTransaction.rollback
		} 
		finally {
			session.close
		}
			//lista.add(elem)
	}
	
	override void sacar(T elem) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.delete(elem)
			session.getTransaction.commit
		} 
		catch (HibernateException e) {
			session.getTransaction.rollback
		} 
		finally {
			session.close
		}
		//lista.remove(elem)
	}
	
	override List<T> elements() 
	
	//Search by example
	override boolean contiene(T elem)
	
	def size(){
		lista.size
	}
}