package futbolcinco.homes

import futbolcinco.FichaInscripcion
import com.mongodb.MongoClient
import org.mongodb.morphia.Morphia

class InscripcionesHomeSQL extends AbstractHomeMongo<FichaInscripcion> {
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	override agregarOActualizar(FichaInscripcion elem) {
		this.save(elem)
	}
	
	override sacar(FichaInscripcion ficha) {
//		this.deleteById(ficha.id)
	}
	
	override elements() {
		this.find().asList()
		
	}
	
	override contiene(FichaInscripcion elem) {
//		val ficha = this.get(elem.id)
		elem != null
	}
	
	override size() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}