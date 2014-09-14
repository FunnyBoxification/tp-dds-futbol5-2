package strategy

import futbolcinco.Partido

class DivisionParImpar extends ModoDivision {
	override void definirDivision(Partido partido){
		val impar = [ int num | num % 2 != 0]
		super.meterEnEquipos(partido,impar)
		}
		
}
	/*def boolean impar(int num){
		if( num==1 || num==3 || num==5 || num==7 || num==9){
			true
		}else{
			false	
		}
	}*/
	
	