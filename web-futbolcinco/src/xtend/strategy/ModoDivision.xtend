package strategy

import futbolcinco.Partido

abstract class ModoDivision {
	def void definirDivision(Partido partido)
	
	def void meterEnEquipos(Partido partido,(int)=>boolean filtro){
		partido.equipo1.clear
		partido.equipo2.clear
		for(inscripto:partido.inscriptos){ 
			if(filtro.apply(partido.inscriptos.indexOf(inscripto))){
				partido.agregarAEquipo1(inscripto)
			}else{
				partido.agregarAEquipo2(inscripto)	
				//
				//ASDDSASADSA
			}
			
		}
	}

}