package command


import futbolcinco.FichaInscripcion
import java.util.LinkedList
import futbolcinco.Calificacion

class UltimasCalificaciones extends Criterio {
	@Property Integer cantidad
	
	new(Integer numero){
		this.cantidad = numero
	}


	override void aplicarCriterio(FichaInscripcion ficha){
		
		var copiaCalific = ficha.inscripto.misCalificaciones as LinkedList<Calificacion>
	/* 	var i = 0 
		var copiaCalific = new LinkedList<Calificacion>
		var size = ficha.inscripto.misCalificaciones.size -1
		while (i < cantidad){
			copiaCalific.add(ficha.inscripto.misCalificaciones.get(size - i))
			i=i+1
		}   no hace falta hacer todo esto */
		
		this.ponderaSegunCalificaciones(copiaCalific,cantidad,ficha)		

	}
		
}