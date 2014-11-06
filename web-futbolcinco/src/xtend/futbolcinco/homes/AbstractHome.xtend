package futbolcinco.homes

import futbolcinco.Administrador
import futbolcinco.Calificacion
import futbolcinco.FichaInscripcion
import futbolcinco.Infraccion
import futbolcinco.Partido
import futbolcinco.Socio
import java.util.LinkedList
import org.hibernate.HibernateException
import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration

class AbstractHome <T> {
	private LinkedList<T> lista
		
	new(){
		lista = new LinkedList<T>
	}
	
	//Ver como agregar los no socios
	public static final SessionFactory sessionFactory = new AnnotationConfiguration()
															.configure()
															.addAnnotatedClass(Socio)
															.addAnnotatedClass(Administrador)
															.addAnnotatedClass(Partido)
															.addAnnotatedClass(FichaInscripcion)
															.addAnnotatedClass(Infraccion)
															.addAnnotatedClass(Calificacion)
															.buildSessionFactory()
		
	
	def LinkedList<T> getByCriterio((T)=>boolean criterio) {
		var listita = new LinkedList<T>
		for(T elem : lista) {
			if(criterio.apply(elem))
				listita.add(elem)
		}
		return listita
		//lista.filter [elem | criterio.apply(elem)] // as LinkedList<T>
	}
	
	def T damePrimero((T)=>boolean criterio) {
		lista.findFirst [elem | criterio.apply(elem)]
	}
	
	def void agregar(T elem) {
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
	
	def void sacar(T elem) {
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
	
	def LinkedList<T> elements() {
		lista
	}
	
	def boolean contiene(T elem){
		lista.contains(elem)
	}
	
	def size(){
		lista.size
	}
}