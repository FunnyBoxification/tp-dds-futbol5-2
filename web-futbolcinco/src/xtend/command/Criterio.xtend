package command

import futbolcinco.FichaInscripcion
import java.util.LinkedList
import futbolcinco.Calificacion

abstract class Criterio {
	def void aplicarCriterio(FichaInscripcion inscripto)
	
	def void ponderaSegunCalificaciones(LinkedList<Calificacion> copiaCalificaciones,Integer cantidad, FichaInscripcion inscripcion){
		if(copiaCalificaciones.size == 0){
			inscripcion.ponderacion = 5.5	
		}else{
			var sumaCalificaciones = 0
			var i = 0
			while(i < cantidad){
				sumaCalificaciones = sumaCalificaciones + copiaCalificaciones.getLast.puntaje
				copiaCalificaciones.remove(copiaCalificaciones.getLast)
				i=i+1
			}
			inscripcion.ponderacion = sumaCalificaciones / cantidad
		}
	}
}