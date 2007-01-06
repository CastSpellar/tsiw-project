package eXistPackage;

import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;

public class QueryExample {
    public static void main(String args[]) throws Exception {
        String driver = "org.exist.xmldb.DatabaseImpl";
        Class cl = Class.forName(driver);
        
        Database database = (Database)cl.newInstance();
        DatabaseManager.registerDatabase(database);
        
        
        Collection col = 
            DatabaseManager.getCollection(
                "xmldb:exist://localhost:8080/exist/xmlrpc/db"
            );
        XPathQueryService service =
            (XPathQueryService) col.getService("XPathQueryService", "1.0");
        service.setProperty("indent", "yes");
                
        ResourceSet result = service.query(args[0]);
        ResourceIterator i = result.getIterator();
        while(i.hasMoreResources()) {
            Resource r = i.nextResource();
            System.out.println((String)r.getContent());
        }
    }
}