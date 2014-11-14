package futbolcinco

import javax.persistence.GeneratedValue
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Column

@Entity
public class Infraccion {
	
	@Id
	@GeneratedValue
	@Property Long id
	
	@Column
	@Property Integer desde;
	
	@Column
	@Property Integer hasta
	
	@Column
	@Property String motivo
	
	new(){
		
	}
}