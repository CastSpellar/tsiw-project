package eXistPackage;

import java.io.*;
import javax.xml.transform.OutputKeys;

import org.apache.xmlrpc.XmlRpcException;
import org.exist.storage.serializers.EXistOutputKeys;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Database;
import org.xmldb.api.base.Resource;
import org.xmldb.api.modules.XMLResource;
import org.xmldb.api.base.XMLDBException;


public class dbGet {
	
	protected final static String driver = "org.exist.xmldb.DatabaseImpl";
	protected final static String URI = "xmldb:exist://localhost:8080/exist/xmlrpc";
	
	public  String getXML(String collection,String filename ) throws XmlRpcException, IOException, XMLDBException, InstantiationException, IllegalAccessException, ClassNotFoundException{
  	    //	  initialize database drivers
		Class cl = Class.forName(driver);
		Database database = (Database) cl.newInstance();
		DatabaseManager.registerDatabase(database);
		// get the collection
		Collection col = DatabaseManager.getCollection(URI + collection);
		col.setProperty(OutputKeys.INDENT, "yes");
		col.setProperty(EXistOutputKeys.EXPAND_XINCLUDES, "no");
        col.setProperty(EXistOutputKeys.PROCESS_XSL_PI, "yes");
		Resource res = col.getResource(filename);
		return (res.getContent()).toString();
	}
	
	public Resource getResource(String collection,String filename) throws XMLDBException, InstantiationException, IllegalAccessException, ClassNotFoundException{
	    //	  initialize database drivers
		Class cl = Class.forName(driver);
		Database database = (Database) cl.newInstance();
		DatabaseManager.registerDatabase(database);
		// get the collection
		Collection col = DatabaseManager.getCollection(URI + collection);
		col.setProperty(OutputKeys.INDENT, "yes");
		col.setProperty(EXistOutputKeys.EXPAND_XINCLUDES, "no");
        col.setProperty(EXistOutputKeys.PROCESS_XSL_PI, "yes");
		return col.getResource(filename);
	}
	
	public XMLResource getXMLResource(String collection,String filename) throws XMLDBException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		return (XMLResource) getResource(collection,filename);
	}

}
