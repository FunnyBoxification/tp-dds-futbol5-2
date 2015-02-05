package futbolcinco.homes

import com.mongodb.MongoClient
import futbolcinco.Socio
import org.mongodb.morphia.Morphia

class SociosDAOMongo extends AbstractHomeMongo<Socio> {
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	override agregarOActualizar(Socio elem) {
		this.save(elem)
	}
	
	override sacar(Socio socio) {
		this.deleteById(socio.id)
		//Si no funca probar this.delete(socio)
	}
	
	override elements() {
		this.find().asList()
		
	}
	
	override contiene(Socio elem) {
		val socio = this.get(elem.id)
		socio != null
	}
	
	override size() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}