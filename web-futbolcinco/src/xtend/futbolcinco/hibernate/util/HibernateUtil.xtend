package futbolcinco.hibernate.util

import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration

class HibernateUtil {
	private static final SessionFactory sessionFactory = buildSessionFactory

	def static SessionFactory buildSessionFactory() {
		try {
			return new Configuration().configure.buildSessionFactory
			
		} catch (Throwable ex) {
			
			throw new ExceptionInInitializerError(ex)
		}
	}

	def static SessionFactory getSessionFactory() {
		return sessionFactory
	}

	def static void shutdown() {
		// Close caches and connection pools
		getSessionFactory().close()
	}
}