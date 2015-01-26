package futbolcinco.homes

import com.mongodb.BasicDBObject
import futbolcinco.Administrador
import java.util.ArrayList

class AdministradoresDAOMongo extends AbstractHomeMongo<Administrador> {
	
	new() {
		super()
	}
	override agregarOActualizar(Administrador elem) {
		val collectionAdmins = db.getCollection("admins")
		var adminDocument = new BasicDBObject()
		adminDocument.put("casilla",elem.casilla)
		collectionAdmins.insert(adminDocument)
	}
	
	override sacar(Administrador elem) {
		val collectionAdmins = db.getCollection("admins")
		var adminDocument = new BasicDBObject()
		adminDocument.put("casilla",elem.casilla)
		collectionAdmins.findAndRemove(adminDocument)
	}
	
	override elements() {
		val collectionSocios = db.getCollection("admins")
		var cursor = collectionSocios.find()
		var lista = new ArrayList<Administrador>
		while(cursor.hasNext()) {
			val jugadorDoc = cursor.next()
			//TODO:Falta agregar el admin cuando se agrega un socio!!
			lista.add(new Administrador(jugadorDoc.get("casilla") as String))
		}
		lista
	}
	
	override contiene(Administrador elem) {
		val collectionSocios = db.getCollection("admins")
		var socioDocument = new BasicDBObject()
		socioDocument.put("casilla",elem.casilla)
		var socio =  collectionSocios.findOne(socioDocument)
		socio != null
	}
	
}