<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>GENERAR EQUIPOS</title>
</head>
<body>
  <div class="body">
  <input type="hidden" name="idPartido" />
  	<form role="form">
  		<div class="form-group">
  			<label> Criterio Seleccion </label>
  			<select class="form-control" name="Criterio-Seleccion"> 
  				<option value="Par/Impar"/>
  				<option value="1,4,5,8,9"/>
  			</select>
  			<br/>	
  			<Label> Criterio de Ordenamiento </Label>			
  			<select class="form-control" name="Criterio-Ordenamiento"> 
  				<option value="Handicap"/>
  				<option value="Promedio calificaciones ultimo partido"/>
  				<option value="Criterio Mixto" />
  				<option value="Promedio ualificaciones ultimos n partidos"/>
  			</select>
  				
  			<button type="button" class="btn btn-primary btn-lg">Generar Equipos</button>	
  			
				<div class="row">
  				<div class="col-md-6">Equipo 1</div>
  				<div class="col-md-6">Equipo 2</div>
				</div>
				
				<button type="button" class="btn btn-success btn-lg">Confirmar Equipos </button>
				
				

  				
  		
  		
  	</form>
  	
  	<div>
  		
  	</div>
  
  </div>
</body>
</html>