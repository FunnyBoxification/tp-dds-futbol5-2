package command

import futbolcinco.FichaInscripcion


class CalificacionesUltimoPartido extends Criterio{

	override aplicarCriterio(FichaInscripcion inscripcion) {
		/* Si, aca hay codigo repetido con UltimasCalificaciones :P */
		if (inscripcion.inscripto.getMisPartidos.size == 0){
		inscripcion.ponderacion = 5.5
	} else{
		var copiaCalificaciones = conseguirFichaUltimoPartido(inscripcion).calificaciones
		this.ponderaSegunCalificaciones(copiaCalificaciones,copiaCalificaciones.size,inscripcion)		
		
		/*
		if(copiaCalificaciones.size == 0){
			inscripcion.ponderacion = 5.5	
		}else{
			var i = 0
			while(i < copiaCalificaciones.size){
				sumaCalificaciones = sumaCalificaciones + copiaCalificaciones.get(i).puntaje
				i=i+1
			}
			inscripcion.ponderacion = sumaCalificaciones / copiaCalificaciones.size
		}*/
	}	
	}
	
	def FichaInscripcion conseguirFichaUltimoPartido(FichaInscripcion inscripcion){
	
	var partido = inscripcion.inscripto.getMisPartidos.getLast
	partido.getInscriptos.findFirst[ficha| ficha.inscripto == inscripcion.inscripto]
	
}	
	
	
	
	/* 	var iterable = home.partidosJugados.filter[partido | buscarSocio(inscripto.inscripto, partido.inscriptos)]
	 	if(iterable.size > 0){
			var partido = iterable.get(iterable.size)	
			var i = 0 
			while (!partido.inscriptos.get(i).inscripto.equals(inscripto.inscripto)){
				i++
			}
			var listaCalificaciones = partido.inscriptos.get(i).calificaciones
			var a = 0
			var listaValores = new ArrayList<Integer>()
			while(a < listaCalificaciones.size){
				listaValores.add(listaCalificaciones.get(a).puntaje)
				a++
			}
			return listaValores
		}else{
			new ArrayList<Integer>()	
		}
	}
	
	/* Averigua si en una lista de inscripciones esta el socio buscado 
	def boolean buscarSocio(Socio buscado, Set<FichaInscripcion> inscripciones){
		var iterable = inscripciones.filter[ficha | ficha.inscripto.equals(buscado)]
		if(iterable.size > 0)
			return true
		return false
	}

 */
}