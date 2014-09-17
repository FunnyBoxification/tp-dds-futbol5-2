/**
 * 
 */

$(document).ready(function() {
	$("#comboCriterios").change( function(event) {
		$.ajax(
				{
					url : $("#comboCriterios").val(),
					success : function(data) {
						response(data);
					}
				});
	});
	
	$("#botonBuscar").click( function(event) {
		$.ajax( 
				{
					data : { paramBusqueda : $("#textBusqueda").val() } ,
					update : "resultadoBusqueda",
					success : function(data) {
						
					}
				}		
		);
	});
	
};









/** NEGRAGA FEA FEA
 * 
 
var criterioParam = $("#nombre");

$(document).ready(function() {
	$("#comboCriterios").change( function(event) {
		switch(this.value) {
		case "getPorNombre": { esconderTodos() ; $("#nombre").show();  criterioParam = $("#nombre"); } break;
		case "getPorEdad": { esconderTodos() ; $("#edad").show(); criterioParam = $("#edad"); } break;
		case "getPorHandicapDesde": { esconderTodos() ;$("#handicapDesde").show();  criterioParam = $("#handicapDesde"); } break;
		case "getPorHandicapHasta": { esconderTodos() ; $("#handicapHasta").show();  criterioParam = $("#handicapHasta"); } break;
		case "getPromDesde": { esconderTodos() ; $("#promDesde").show();  criterioParam = $("#promDesde"); } break;
		case "getPromHasta": { esconderTodos() ; $("#promHasta").show();  criterioParam = $("#promHasta"); } break;
		}
	});
	$("#botonBuscar").click( function(event) {
		$.ajax( 
				{
					url: "busquedaJugador/" + $("#comboCriterios").val(),
					data: criterioParam.val() , 
					success : function() {
						//agregar las cosas a la lista
					}
				}
			);
	});
	
});

function esconderTodos() {
	$("#nombre").hide();
	$("#edad").hide();
	$("#handicapDesde").hide();
	$("#handicapHasta").hide();
	$("#promDesde").hide();
	$("#promHasta").hide();
	
}

*/