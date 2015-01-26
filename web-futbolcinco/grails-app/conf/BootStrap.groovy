import futbolcinco.Administrador
import futbolcinco.InscripcionEstandar
import futbolcinco.ModoInscripcion
import futbolcinco.Socio
import futbolcinco.homes.AdministradoresDelSistema
import futbolcinco.homes.ModoInscripcionHomeSQL
import futbolcinco.homes.SociosDelSistema

class BootStrap {

    def init = { servletContext ->
		
		Administrador administrador = new Administrador("admin@admin.com")
		AdministradoresDelSistema.instance().agregarOActualizar(administrador)	
		
		ModoInscripcion modoEstandar = new InscripcionEstandar()
		ModoInscripcionHomeSQL.instance().agregarOActualizar(modoEstandar)
		
		def socioH = new Socio("martin",18,"marty@piola.com",administrador)
		def amigo = new Socio("pepe",18,"marty@piola.com",administrador)
		def socio3 = new Socio("pablo",21,"bobo@piola.com",administrador)
		def socio4 = new Socio("juli",17,"martfsdfsfy@piola.com",administrador)
		def socio5 = new Socio("martsdfin",18,"marty@piola.com",administrador)
		def socio6 = new Socio("masfrtin",18,"marty@piola.com",administrador)
		def socio7 = new Socio("sdfsdfmartin",18,"marty@piola.com",administrador)
		def socio8 = new Socio("marsdfstin",18,"marty@piola.com",administrador)
		def socio9 = new Socio("martidfn",18,"marty@piola.com",administrador) 
		def socio10 = new Socio("martin1234",18,"marty@piola.com",administrador)
		socioH.handicap = 9
		socioH.amigos.add(amigo)
		SociosDelSistema.instance().agregarOActualizar(amigo)
		SociosDelSistema.instance().agregarOActualizar(socioH)
		SociosDelSistema.instance().agregarOActualizar(socio3)
		SociosDelSistema.instance().agregarOActualizar(socio4)
		SociosDelSistema.instance().agregarOActualizar(socio5)
		SociosDelSistema.instance().agregarOActualizar(socio6)
		SociosDelSistema.instance().agregarOActualizar(socio7)
		SociosDelSistema.instance().agregarOActualizar(socio8)
		SociosDelSistema.instance().agregarOActualizar(socio9)
		SociosDelSistema.instance().agregarOActualizar(socio10)
		
		def partidito = administrador.organizarPartido(10082014, 1830)
		socioH.inscribirseA(partidito, modoEstandar)
		amigo.inscribirseA(partidito,modoEstandar)
		socio3.inscribirseA(partidito,modoEstandar)
		socio4.inscribirseA(partidito,modoEstandar)
		socio5.inscribirseA(partidito,modoEstandar)
		socio6.inscribirseA(partidito,modoEstandar)
		socio7.inscribirseA(partidito,modoEstandar)
		socio8.inscribirseA(partidito,modoEstandar)
		socio9.inscribirseA(partidito,modoEstandar)
		socio10.inscribirseA(partidito,modoEstandar)
    }
    def destroy = {
    }
}
