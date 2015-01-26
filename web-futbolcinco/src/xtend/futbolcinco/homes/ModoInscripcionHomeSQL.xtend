package futbolcinco.homes

import futbolcinco.ModoInscripcion

class ModoInscripcionHomeSQL extends AbstractHomeSQL<ModoInscripcion> {
	
	static ModoInscripcionHomeSQL instance
	
	def static instance() { 
		if(instance == null ) { 
			return new ModoInscripcionHomeSQL
		}
		else return instance
	}
		
		override elements() {
			throw new UnsupportedOperationException("TODO: auto-generated method stub")
		}
		
		override contiene(ModoInscripcion elem) {
			throw new UnsupportedOperationException("TODO: auto-generated method stub")
		}
	
}