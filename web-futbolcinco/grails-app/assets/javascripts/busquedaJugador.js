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
					}
				}		
		);
	});
	
});


function getUrl(action) {
	return app.linkBusqueda + "/" + action;
}
