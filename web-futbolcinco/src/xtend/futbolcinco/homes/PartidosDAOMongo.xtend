package futbolcinco.homes

import com.mongodb.BasicDBObject
import com.mongodb.MongoClient
import futbolcinco.Partido
import java.util.ArrayList
import org.mongodb.morphia.Morphia

class PartidosDAOMongo extends AbstractHomeMongo<Partido> {
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	
//	static PartidosDAOMongo instance
//	
//	def static instance() {
//		if(instance == null) {
//			return new PartidosDAOMongo
//		}
//		else return instance
//	}
	
	override agregarOActualizar(Partido partido) {
		this.save(partido)
		
	}
	
	override contiene(Partido partido) {
		val part = this.get(partido.id)
		part != null
	}
	
	override elements() {
		this.find().asList()
	}
	
	override sacar(Partido partido) {
		this.deleteById(partido.id)
	}

	override size() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}