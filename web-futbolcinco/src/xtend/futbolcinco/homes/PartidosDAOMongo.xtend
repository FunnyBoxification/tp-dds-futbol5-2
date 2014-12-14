package futbolcinco.homes

import com.mongodb.BasicDBObject
import futbolcinco.Partido

class PartidosDAOMongo extends AbstractHomeMongo<Partido> {
	
	override agregar(Partido partido) {
		val partidosCollection = db.getCollection("partidos")
		var partidoDocument = new BasicDBObject()
		partidoDocument.put("dia",partido.dia)
		partidoDocument.put("hora",partido.hora)
		partidoDocument.put("admin",partido.admin)
		//TODO:Ver como poner las listas
		partidosCollection.insert(partidoDocument)
		
	}
	
	override contiene(Partido partido) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override elements() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override sacar(Partido partido) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}