		<div class="col-md-12">
			<table class="table table-striped table-bordered table-hover table-condensed">
				<thead>
					<g:sortableColumn title="Nombre" property="nombre"/>
					<g:sortableColumn title="Edad" property="edad"/>
					<g:sortableColumn title ="Handicap" property="handicap"/>
					<g:sortableColumn title ="Promedio" property="promedio"/>
				</thead>
				<tbody>
					<g:each in="${socios}" var="socio">
						<tr class="info" style="${socio.handicap >=8 ? "background-color:#99CCFF;" : "" }">
							<td class="col-md-3">
								<g:link controller="busquedaJugador" action="datosJugador" params = "{nombre:socio.nombre}">${socio.nombre}</g:link>
							</td>
							<td class="col-md-3">
								${socio.edad }
							</td>
							<td class="col-md-3">
							${socio.handicap }
							</td>
							<td class="col-md-3">
							   ${socio.promedio }
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>