package futbolcinco.homes

import com.mongodb.BasicDBObject
import com.mongodb.DB
import futbolcinco.Administrador
import futbolcinco.Socio
import java.util.ArrayList

class SociosDAOMongo extends AbstractHomeMongo<Socio> {
	DB db
	
	override agregar(Socio elem) {
		val collectionSocios = db.getCollection("socios")
		var socioDocument = new BasicDBObject()
		socioDocument.put("nombre",elem.nombre)
		socioDocument.put("edad",elem.edad)
		socioDocument.put("casilla",elem.casilla)
		//Ver como persistir relacionas
		collectionSocios.insert(socioDocument)
	}
	
	override sacar(Socio socio) {
		val collectionSocios = db.getCollection("socios")
		var socioDocument = new BasicDBObject()
		socioDocument.put("nombre",socio.nombre)
		socioDocument.put("edad",socio.edad)
		socioDocument.put("casilla",socio.casilla)
		collectionSocios.findAndRemove(socioDocument)
	}
	
	override elements() {
		val collectionSocios = db.getCollection("socios")
		var cursor = collectionSocios.find()
		var lista = new ArrayList<Socio>
		while(cursor.hasNext()) {
			val jugadorDoc = cursor.next()
			//TODO:Falta agregar el admin cuando se agrega un socio!!
			lista.add(new Socio(jugadorDoc.get("nombre") as String, 
				jugadorDoc.get("edad") as Integer, jugadorDoc.get("casilla") as String,
				jugadorDoc.get("admin") as Administrador))
		}
		lista
		
	}
	
	override contiene(Socio elem) {
		val collectionSocios = db.getCollection("socios")
		var socioDocument = new BasicDBObject()
		socioDocument.put("nombre",elem.nombre)
		socioDocument.put("edad",elem.edad)
		socioDocument.put("casilla",elem.casilla)
		var socio =  collectionSocios.findOne(socioDocument)
		socio != null
	}
	
}