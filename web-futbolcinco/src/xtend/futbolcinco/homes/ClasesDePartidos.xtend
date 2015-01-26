package futbolcinco.homes

import futbolcinco.Partido
import java.util.List

interface ClasesDePartidos {
	
	def void agregarOActualizar(Partido elem)
	
	def void sacar(Partido elem)
	
	def List<Partido> elements() 
	
	//Search by example
	def boolean contiene(Partido elem)
	
	def int size()

	
}