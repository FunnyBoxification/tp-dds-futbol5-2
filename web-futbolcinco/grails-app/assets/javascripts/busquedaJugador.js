/**
 * 
 */

$(document).ready(function() {
	$("#botonBuscar").click( function(event) {
		$.ajax( 
				{
					url: "busquedaJugador/" + $("#comboCriterios").val(),
					success : function() {
						//agregar las cosas a la lista
					}
				}
			);
	});
	
});