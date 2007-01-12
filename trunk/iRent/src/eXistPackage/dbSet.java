package eXistPackage;

import java.io.File;

import org.exist.storage.DBBroker;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Database;
import org.xmldb.api.modules.CollectionManagementService;
import org.xmldb.api.modules.XMLResource;

public class dbSet {

	 public final static String URI = "xmldb:exist://localhost:8080/exist/xmlrpc";
	 public final static String driver = "org.exist.xmldb.DatabaseImpl";
	 
	 public void setXML(String collection,String filename) throws Exception{
			Class cl = Class.forName(driver);			
			Database database = (Database)cl.newInstance();
			database.setProperty("create-database", "true");
			DatabaseManager.registerDatabase(database);
			
			Collection col = 
				DatabaseManager.getCollection(URI + collection);
			if(col == null) {
	            Collection root = DatabaseManager.getCollection(URI + DBBroker.ROOT_COLLECTION);
	            CollectionManagementService mgtService = 
	                (CollectionManagementService)root.getService("CollectionManagementService", "1.0");
	            col = mgtService.createCollection(collection.substring((DBBroker.ROOT_COLLECTION + "/").length()));
	        }
			File f = new File(filename);
			XMLResource document = (XMLResource)col.createResource(f.getName(), "XMLResource");
			document.setContent(f);
			col.storeResource(document);
	 }
	 
	 public void setResource(String collection, String filnename){
		 
	 }
	
}
