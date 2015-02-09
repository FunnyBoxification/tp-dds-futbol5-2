<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<script type="text/javascript">
function volver(){
	window.history.back();
}
</script>
</head>
<body>
<h2>Datos del jugador</h2>

<label for="exampleInputEmail1"> Nombre:</label>
<input class="form-control" id="disabledInput" name="jugador.nombre" value="${jugador?.nombre}" disabled>
<br /><br />
<label for="exampleInputEmail1">Handicap:</label>
<input class="form-control" id="disabledInput"name="jugador.handicap" value="${jugador?.handicap}"  disabled>
<br /><br />
<label for="exampleInputEmail1">Promedio del ultimo partido:</label>
<input class="form-control" id="disabledInput" name="jugador.promUltPartido" value="${jugador.promedio}" disabled>
<br /><br />
<label for="exampleInputEmail1">Promedio de todos los partidos que jugo:</label>
<input class="form-control" id="disabledInput"name="jugador.promUltNPartidos" value="${jugador.promedio}"  disabled>
<br /><br />
<label for="exampleInputEmail1">Edad:</label>
<input class="form-control" id="disabledInput"name="jugador.edad" value="${jugador?.edad}"  disabled>
<br /><br />
<label for="exampleInputEmail1">Grilla de Amigos:</label>
 <g:render template="grilla" model="['socios': jugador.amigos, 'i':i]"></g:render>
<br /><br />
<label for="exampleInputEmail1">Grilla de Infracciones:</label>
<br /><br />
<label for="exampleInputEmail1">Cantidad de partidos que jugo:</label>
<input class="form-control" id="disabledInput" name="jugador.cantPartidosJugados" value="${jugador?.misPartidos?.size}"  disabled>
<br /><br /><br />

 <button type="button" class="btn btn-default btn-lg" onclick="javascript:volver()">VOLVER</button>




</body>
</html>


