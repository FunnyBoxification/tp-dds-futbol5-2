<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Equipos Generados</title>
<style type="text/css">
#main{
	margin-left:45px;
	margin-right:45px;
	margin-top:10px;
	margin-bottom:5px
}
#boton_generarEquipos{
	float: right;
	margin-top: 10px;
}
#boton_confirmarEquipos{
	float: right;
	margin-top: -2px;
	margin-left: 720px;
	display: none;
}
#organizacion_equipos{
	height: 60px;
}
</style>
</head>
<body>
	<div id="main">
		<div class="row">
 	<g:each in="${equipos}" status="i" var="equipo">
		<div class="col-md-6" style="width: 100%">Equipo</div>
		<g:render template="/busquedaJugador/grilla" model="['socios': equipo, 'i':i]"></g:render>
	</g:each>
</div>
		
	</div>
</body>
</html>