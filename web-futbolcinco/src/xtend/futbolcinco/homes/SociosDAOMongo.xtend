package futbolcinco.homes

import com.mongodb.MongoClient
import futbolcinco.Socio
import org.mongodb.morphia.Morphia

abstract class SociosDAOMongo extends AbstractHomeMongo<Socio> {
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	override agregarOActualizar(Socio elem) {
		this.save(elem)
	}
	
	override sacar(Socio socio) {
		this.deleteById(socio.id)
	}
	
	override elements() {
		this.find().asList()
		
	}
	
	override contiene(Socio elem) {
		val socio = this.get(elem.id)
		socio != null
	}
	
}