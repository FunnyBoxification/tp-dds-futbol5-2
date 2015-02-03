package futbolcinco.homes

import java.util.List

interface AbstractHome<T> {
	def void agregarOActualizar(T elem)
	def void sacar(T elem)
	def List<T> elements() 
	def boolean contiene(T elem)
	def int size()
	
}