package strategy

import futbolcinco.Partido
import futbolcinco.homes.PartidosDelSistema

abstract class ModoDivision {
	def void definirDivision(Partido partido)
	
	def void meterEnEquipos(Partido partido,(int)=>boolean filtro){
//		partido.equipo1.clear
//		partido.equipo2.clear
		for(inscripto:partido.inscriptos){ 
			if(filtro.apply(partido.inscriptos.indexOf(inscripto))){
				//inscripto.numeroEquipo = 1
				partido.agregarAEquipo1(inscripto)
			}else{
				//inscripto.numeroEquipo = 2
				partido.agregarAEquipo2(inscripto)	
				//
				//ASDDSASADSA
			}
			
		}
		PartidosDelSistema.instance().agregarOActualizar(partido)
		
	}

}