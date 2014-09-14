package strategy

import futbolcinco.Partido


class DivisionEspecifica extends ModoDivision {
	override void definirDivision(Partido partido){
		val lambda = [ int num | num == 0 || num == 3 || num == 4 ||  num == 7 || num== 8]
		super.meterEnEquipos(partido,lambda)
	}
	/*def boolean equipoEspecifico(int num){
		if( num==1 || num==4 || num==5 || num==8 || num==9){
			true
		}else{
			false	
		}
	}*/
	
	
	

}