package futbolcinco.homes

import futbolcinco.ModoInscripcion
import org.mongodb.morphia.Morphia
import com.mongodb.MongoClient

class ModoInscripcionDAOMongo extends AbstractHomeMongo<ModoInscripcion> {
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	override agregarOActualizar(ModoInscripcion elem) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override sacar(ModoInscripcion elem) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override elements() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override contiene(ModoInscripcion elem) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override size() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}