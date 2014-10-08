<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Generar Equipos</title>
<script type="text/javascript">
function confirmarEquipos(){
	alert("intento de confirmar equipos")
}

function habilitarCheckBox(){
		document.getElementById('check').style.display="block"
}

function deshabilitarCheckBox(){
		document.getElementById('check').style.display="none"
}

function solicitarEquipos(){
	$.ajax({
		url:"solicitarEquipos",
		data: {criterioSeleccion: $('#criterioSeleccion').val(),
				criterioOrden: $('#criterioOrden').val()},
		success: function(data){
				alert("La operacion se realizo con exito.")
				$('#resultadosEquipos').html(data)
				document.getElementById('boton_confirmarEquipos').style.display="block"
			},
		error: function(){
				alert("Ha ocurrido un error. Intentalo nuevamente")
			}
		
	})	
}
</script>
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
		<input type="hidden" name="idPartido" />
	  	<div id="organizacion_equipos" class="form-group">
	  		<div style="width: 353px; float: left;">
	  			<label>Criterio Seleccion</label>
		  		<select class="form-control" id="criterioSeleccion"> 
		  			<option>Par/Impar</option>
		  			<option>1,4,5,8,9</option>
		  			<option selected>---</option>
		  		</select>
	  		</div>
	  		<div style="width: 517px; float: left;">
	  			<Label>Criterio de Ordenamiento</Label>			
		  		<select class="form-control" id="criterioOrden"> 
		  			<option onclick="javascript:deshabilitarCheckBox()">Handicap</option>
		  			<option onclick="javascript:deshabilitarCheckBox()">Promedio calificaciones ultimo partido</option>
		  			<option onclick="javascript:habilitarCheckBox()">Criterio Mixto</option>
					<option onclick="javascript:deshabilitarCheckBox()">Promedio calificaciones ultimos n partidos</option>
					<option selected onclick="javascript:deshabilitarCheckBox()" >---</option>
				</select>
				<div class="checkbox" id="check" style="display: none">
		   			<label>
		     			 <input type="checkbox"> Handicap
		    		</label>
		    		</br>
		    		<label>
		     			 <input type="checkbox"> Promedio calificaciones ultimo partido
		    		</label>
		    		</br>
		    		<label>
		     			 <input type="checkbox"> Promedio calificaciones ultimos n partidos
		    		</label>
				</div>
	  		</div>
	  		<button id="boton_generarEquipos" type="button" class="btn btn-primary btn-lg" onclick="javascript:solicitarEquipos()">Generar Equipos</button>	
	  	</div>
	
	  	<div id="resultadosEquipos"></div>
	  		
		<button id="boton_confirmarEquipos" type="button" class="btn btn-success btn-lg" onclick="javascript:confirmarEquipos()">Confirmar Equipos </button>
		
	</div>
</body>
</html>