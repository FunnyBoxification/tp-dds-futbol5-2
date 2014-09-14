package futbolcinco.homes

import java.util.LinkedList

class AbstractHome <T> {
	LinkedList<T> lista
	
	new(){
		lista = new LinkedList<T>
	}
	
	def LinkedList<T> getByCriterio((T)=>boolean criterio) {
		lista.filter [elem | criterio.apply(elem)] as LinkedList<T>
	}
	
	def T damePrimero((T)=>boolean criterio) {
		lista.findFirst [elem | criterio.apply(elem)]
	}
	
	def void agregar(T elem) {
		lista.add(elem)
	}
	
	def void sacar(T elem) {
		lista.remove(elem)
	}
	
	def LinkedList<T> elements() {
		lista
	}
	
	def boolean contiene(T elem){
		lista.contains(elem)
	}
	
	def size(){
		lista.size
	}
}