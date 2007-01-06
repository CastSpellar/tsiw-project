package eXistPackage;

import javax.xml.transform.OutputKeys;

import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Database;
import org.xmldb.api.modules.XMLResource;

public class RetrieveExample {
    protected static String URI = "xmldb:exist://localhost:8080/exist/rest/";

    public static void main(String args[]) throws Exception {
        String driver = "org.exist.xmldb.DatabaseImpl";
        
        // initialize database driver
        Class cl = Class.forName(driver);
        Database database = (Database)cl.newInstance();
        DatabaseManager.registerDatabase(database);

        // get the collection
        Collection col = DatabaseManager.getCollection("xmldb:exist://localhost:8080/exist/xmlrpc/db/shakespeare/plays");
        col.setProperty(OutputKeys.INDENT, "no");
        XMLResource res = (XMLResource)col.getResource("macbeth.xml");
        if(res == null)
            System.err.println("document not found!");
        else
            System.err.println(res.getContent());   }
}
