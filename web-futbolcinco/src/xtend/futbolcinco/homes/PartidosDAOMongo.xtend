package futbolcinco.homes

import com.mongodb.MongoClient
import futbolcinco.FichaInscripcion
import futbolcinco.Partido
import futbolcinco.Socio
import java.util.ArrayList
import java.util.List
import org.mongodb.morphia.Morphia

class PartidosDAOMongo extends AbstractHomeMongo<Partido> {
	
	private static PartidosDAOMongo instance
	
	def static instance() {
		if(instance != null) {
			instance
		}
		else {
			instance = new PartidosDAOMongo(new Morphia, new MongoClient, "entrega9")
			return instance
		}
	}
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(morphia, mongo, dbName)
	}
	
	
//	static PartidosDAOMongo instance
//	
//	def static instance() {
//		if(instance == null) {
//			return new PartidosDAOMongo
//		}
//		else return instance
//	}
	
	override agregarOActualizar(Partido partido) {
		this.save(partido)
		
	}
	
	override contiene(Partido partido) {
		val part = this.get(partido.id)
		part != null
	}
	
	override elements() {
		this.find().asList()
	}
	
	override sacar(Partido partido) {
		this.deleteById(partido.id)
	}

	override size() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def Partido buscarPartido(Long id) {
		this.elements.get(0)
	}
	
	def List<Socio> getListaSociosEquipo1(Partido partido) {
		var lista = new ArrayList<Socio>
		for(FichaInscripcion ficha : partido.equipo1.integrantes) {
			lista.add(ficha.inscripto)
		}
		lista
	}
	
	def List<Socio> getListaSociosEquipo2(Partido partido) {
		var lista = new ArrayList<Socio>
		for(FichaInscripcion ficha : partido.equipo2.integrantes) {
			lista.add(ficha.inscripto)
		}
		lista
	}
	
	
}