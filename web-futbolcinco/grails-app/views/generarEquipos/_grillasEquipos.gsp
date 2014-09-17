<div class="row">
 	<g:each in="${equipos}" status="i" var="equipo">
		<div class="col-md-6">Equipo</div>
		<g:render template="/busquedaJugador/grilla" model="['socios': equipo, 'i':i]"></g:render>
	</g:each>
</div>