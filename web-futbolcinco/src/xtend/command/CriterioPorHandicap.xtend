package command

import futbolcinco.FichaInscripcion

class CriterioPorHandicap extends Criterio {
	
	override aplicarCriterio(FichaInscripcion fichaInscripto) {
		fichaInscripto.ponderacion = fichaInscripto.inscripto.handicap as double
	}
	
}