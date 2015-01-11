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
		partidoDocument.put("equipo1",new ArrayList(partido.equipo1))
		partidoDocument.put("equipo2",new ArrayList(partido.equipo2))
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
		val collectionPartidos = db.getCollection("socios")
		var partidoDocument = new BasicDBObject()
		partidoDocument.put("nombre",partido.dia)
		partidoDocument.put("edad",partido.hora)
		partidoDocument.put("casilla",partido.admin)
		collectionPartidos.findAndRemove(partidoDocument)
	}
	
}