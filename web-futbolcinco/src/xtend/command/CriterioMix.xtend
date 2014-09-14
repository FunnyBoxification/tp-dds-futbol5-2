package command

import futbolcinco.FichaInscripcion
import java.util.LinkedList

class CriterioMix extends Criterio {
	
	@Property LinkedList<Criterio> criterios
	Double ponderacionFinal
	
	new(LinkedList<Criterio> crits) {
		criterios = crits
		ponderacionFinal = 0 as double
	}
	
	override aplicarCriterio(FichaInscripcion inscripto) {
		criterios.forEach [ criterio | criterio.aplicarCriterio(inscripto)
			ponderacionFinal = ponderacionFinal + inscripto.ponderacion
		]
		inscripto.ponderacion = ponderacionFinal
		ponderacionFinal = 0 as double // No me dejaba con variable local asi que la hice de instancia :/
	}
	
}