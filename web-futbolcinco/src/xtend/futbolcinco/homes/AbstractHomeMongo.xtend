package futbolcinco.homes

import com.mongodb.MongoClient
import org.bson.types.ObjectId
import org.mongodb.morphia.Morphia
import org.mongodb.morphia.dao.BasicDAO

abstract class AbstractHomeMongo<T>  extends  BasicDAO<T, ObjectId> implements AbstractHome<T> {
	
	new(Morphia morphia, MongoClient mongo, String dbName) {
		super(mongo,morphia,dbName)
	}
	
}