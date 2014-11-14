<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Buscar Jugador</title>
</head>
<body>
  <div class="body">
  	<div class="form-horizontal">
  		<div class="form-group">
  		<br>
  			<label> Criterio </label>
  			<select class="form-control" id="comboCriterios"> 
  				<option value="porNombre">Por nombre </option>
  				<option value="porEdad">Por edad menor a</option>
  				<option value="porHandicapDesde">Por handicap desde</option>
  				<option value="porHandicapHasta">Por handicap hasta</option>
  				<option value="porPromDesde">Por promedio Desde</option>
  				<option value="porPromHasta">Por Promedio Hasta</option>
  				<option value="conInfracciones">Con infracciones</option>
  				<option value="sinInfracciones">Sin infracciones</option>
  				<option value="todos"> Todos</option>	
  			</select>
  		</div>
  		<div id="optionSelected">
  		</div>
  		
  		<button id="botonBuscar" type="button" class="btn btn-default">Buscar</button>		 		
 	</div>
  	
  	<div class="col-md-12" >
  		<br>
  		<b>Resultados de la b&uacute;squeda</b> 
  		<div id="resultadoBusqueda">
  		</div>
  	</div>
  
  </div>
</body>
</html>