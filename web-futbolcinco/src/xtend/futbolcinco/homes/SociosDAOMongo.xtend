package futbolcinco.homes

import com.mongodb.MongoClient
import futbolcinco.Socio
import java.util.ArrayList
import java.util.List
import org.bson.types.ObjectId
import org.mongodb.morphia.Morphia

class SociosDAOMongo extends AbstractHomeMongo<Socio> {
	
	private static SociosDAOMongo instance
	
	def static instance() {
		if(instance != null) 
			return instance
		else {
			instance = new SociosDAOMongo(new Morphia, new MongoClient, "entrega9")
			return instance
		}
	}
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	def List<Socio> buscarPorNombre(String nombre) {
		ds.find(Socio).filter("nombre =",nombre).asList
	}
	
	def List<Socio> buscarPorEdad(Integer edad) {
		ds.find(Socio).filter("edad <=",edad).asList
	}
	
	def List<Socio> buscarPorHandicapDesde(Integer handicap) {
		ds.find(Socio).filter("handicap >=", handicap).asList
	}
	
	def List<Socio> buscarPorHandicapHasta(Integer handicap) {
		ds.find(Socio).filter("handicap <=", handicap).asList
	}
	
	def Socio buscarPorId(ObjectId objId) {
		this.get(objId)
	}
	
	def List<Socio> buscarPorPromedioLastMatchHasta(Double promedio) {
		return this.elements
	}
	
	def List<Socio> buscarPorPromedioLastMatchDesde(Double promedio) {
		return new ArrayList<Socio>
	}
	
	def List<Socio> buscarSinInfracciones() {
		return this.elements
	}
	
	def List<Socio> buscarConInfracciones() {
		return new ArrayList<Socio>
	}
	
	
	
	override agregarOActualizar(Socio elem) {
//		if(elem.id != null) {
//			var updateQuery = datastore.createQuery(Socio).field("_id").equal(elem.id)
//			var updateOperation = 
//			this.update(updateQuery,)
//			
//		}
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