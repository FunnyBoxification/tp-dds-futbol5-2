package futbolcinco.homes

import com.mongodb.MongoClient
import futbolcinco.Administrador
import org.mongodb.morphia.Morphia

class AdministradoresDAOMongo extends AbstractHomeMongo<Administrador> {
	
	private static AdministradoresDAOMongo instance
	
	def static instance() {
		if(instance != null) {
			instance
		}
		else {
			instance = new AdministradoresDAOMongo(new Morphia, new MongoClient, "entrega9")
			return instance
		}
	}
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	override agregarOActualizar(Administrador elem) {
		this.save(elem)
	}
	
	override sacar(Administrador elem) {
		this.deleteById(elem.id)
	}
	
	override elements() {
		this.find().asList()
	}
	
	override contiene(Administrador elem) {
		val admin = this.get(elem.id)
		admin != null
	}
	
	override size() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}