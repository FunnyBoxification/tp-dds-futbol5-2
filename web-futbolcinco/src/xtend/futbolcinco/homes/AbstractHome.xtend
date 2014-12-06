package futbolcinco.homes

import java.util.List

interface AbstractHome<T> {
	def void agregar(T elem)
	def void sacar(T elem)
	def List<T> elements() 
	def boolean contiene(T elem)
	
}