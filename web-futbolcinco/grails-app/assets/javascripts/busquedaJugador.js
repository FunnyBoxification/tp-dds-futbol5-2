/**
 * 
 */

$(document).ready(function() {
	$("#comboCriterios").change( function(event) {
		$.ajax(
				{
					url : getUrl($("#comboCriterios").val()),
					update : "opcionSelected",
					success : function(data) {
						$("#optionSelected").html(data);
						//response(data);
					}
				});
	});
	
	$("#botonBuscar").click( function(event) {
		$.ajax( 
				{
					url : getUrl("buscar" + $("#comboCriterios").val()),
					data : { paramBusqueda : $("#textBusqueda").val() } ,
					update : "resultadoBusqueda",
					success : function(data) {
						$("#resultadoBusqueda").html(data);
						//hacer algo.. -> creo que no hace falta hacer nada, lo puse para que lo haga el controller
					}
				}		
		);
	});
	
});


function getUrl(action) {
	return app.linkBusqueda + "/" + action;
}
