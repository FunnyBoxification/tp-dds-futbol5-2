package futbolcinco.homes

import com.mongodb.BasicDBObject
import futbolcinco.Partido
import java.util.ArrayList

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
		val partidosCollection = db.getCollection("partidos")
		var partidoDocument = new BasicDBObject()
		partidoDocument.put("dia",partido.dia)
		partidoDocument.put("hora",partido.hora)
		partidoDocument.put("admin",partido.admin)
		var partidoD =  partidosCollection.findOne(partidoDocument)
		partidoD != null
	}
	
	override elements() {
		val partidosCollection = db.getCollection("partidos")
		var cursor = partidosCollection.find()
		var lista = new ArrayList<Partido>
		while(cursor.hasNext()) {
			val partidoDoc = cursor.next()
			//TODO:Agregar fields
			lista.add(new Partido())
		}
		lista
		
	}
	
	override sacar(Partido partido) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}