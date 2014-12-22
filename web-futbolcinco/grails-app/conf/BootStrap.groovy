import futbolcinco.Administrador
import futbolcinco.Socio
import futbolcinco.homes.SociosDelSistema
import futbolcinco.homes.AdministradoresDelSistema

class BootStrap {

    def init = { servletContext ->
		
		Administrador administrador = new Administrador("admin@admin.com")
		AdministradoresDelSistema.instance().agregar(administrador)	
		
		def socioH = new Socio("martin",18,"marty@piola.com",administrador)
		def amigo = new Socio("pepe",18,"marty@piola.com",administrador)
		socioH.handicap = 9
		socioH.amigos.add(amigo)
		SociosDelSistema.instance().agregar(amigo)
		SociosDelSistema.instance().agregar(socioH)
		SociosDelSistema.instance().agregar(new Socio("pablo",21,"bobo@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("juli",17,"martfsdfsfy@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("martsdfin",18,"marty@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("masfrtin",18,"marty@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("sdfsdfmartin",18,"marty@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("marsdfstin",18,"marty@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("martidfn",18,"marty@piola.com",administrador))
		SociosDelSistema.instance().agregar(new Socio("martin1234",18,"marty@piola.com",administrador))
		
		def partidito = administrador.organizarPartido(10082014, 1830)
    }
    def destroy = {
    }
}
