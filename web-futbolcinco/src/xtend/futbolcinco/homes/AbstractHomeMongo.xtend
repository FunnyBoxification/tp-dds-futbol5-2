package futbolcinco.homes

import com.mongodb.DB
import com.mongodb.Mongo

abstract class AbstractHomeMongo<T> implements AbstractHome<T> {
	
	DB db
	
	new() {
		val mongo = new Mongo("localhost", 27017)
		db = mongo.getDB("local")
	}
	
}