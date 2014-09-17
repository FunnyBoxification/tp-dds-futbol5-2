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
  			<label> Criterio </label>
  			<select class="form-control" id="comboCriterios"> 
  				<option value="getPorNombre">Por nombre </option>
  				<option value="getPorEdad">Por edad menor a</option>
  				<option value="getHandicapDesde">Por handicap desde</option>
  				<option value="getHandicapHasta">Por handicap hasta</option>
  				<option value="getPromDesde">Por promedio Desde</option>
  				<option value="getPromHasta">Por Promedio Hasta</option>
  				<option value="getConInfraciones">Con infracciones</option>
  				<option value="getSinInfracciones">Sin infracciones</option>
  				<option value="getTodos"> Todos</option>	
  			</select>
  		</div>
  		<input type="text" id="nombre" placeholder="Ingrese nombre" >
  		<input type="text" id="edad" hidden>
  		<input type="text" id="handicapDesde" hidden>
  		<input type="text" id="handicapHasta" hidden>
  		<input type="text" id="promDesde" hidden>
  		<input type="text" id="promHasta" hidden>
 		
  		<button id="botonBuscar" type="button" class="btn btn-default">Buscar</button>
  		  	
  	</div>
  	
  	<div class="col-md-12" id="resultadoBusqueda" name="resultadoBusqueda">
  		<b>Resultados de la bu&acute;squeda</b> <br/>
  		<table class="table table-striped table-bordered table-hover table-condensed">
				<thead>
				<!--  
					<g:sortableColumn property="nombre" title="Nombre" />
					<g:sortableColumn property="ubicacionMateria" title="Handicap"/>
					<g:sortableColumn property="promedio" title = "Promedio"/>
				</thead> -->
				<tbody>
					<!--  Meter data here con ajax -->
				</tbody>
			</table>
  		
  	
  	</div>
  
  </div>
</body>
</html>