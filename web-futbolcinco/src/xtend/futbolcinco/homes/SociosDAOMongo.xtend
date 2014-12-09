package futbolcinco.homes

import com.mongodb.DB
import futbolcinco.Socio

class SociosDAOMongo extends AbstractHomeMongo<Socio> {
	DB db
	
	override agregar(Socio elem) {
	}
	
	override sacar(Socio elem) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override elements() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override contiene(Socio elem) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}