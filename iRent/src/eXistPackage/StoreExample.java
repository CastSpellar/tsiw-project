package eXistPackage;

import java.io.File;

import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Database;
import org.xmldb.api.modules.CollectionManagementService;
import org.xmldb.api.modules.XMLResource;

public class StoreExample {
    public final static String URI = "xmldb:exist://localhost:8080/exist/xmlrpc";

    public static void main(String args[]) throws Exception {
        if(args.length < 2) {
            System.out.println("usage: StoreExample collection-path document");
            System.exit(1);
        }

        String collection = args[0], file = "src/schemaFiles/"+args[1];
 

        // initialize driver
        String driver = "org.exist.xmldb.DatabaseImpl";
        Class cl = Class.forName(driver);
        Database database = (Database)cl.newInstance();
        DatabaseManager.registerDatabase(database);

        // try to get collection
        Collection col = DatabaseManager.getCollection(URI + collection);
        
        if(col != null) {
            // collection does not exist: get root collection and create
            // for simplicity, we assume that the new collection is a
            // direct child of the root collection, e.g. /db/test.
            // the example will fail otherwise.
            Collection root = DatabaseManager.getCollection(URI + "/db");
            CollectionManagementService mgtService = (CollectionManagementService)
                root.getService("CollectionManagementService", "1.0");
            col = mgtService.createCollection(collection);
            System.out.println("Entrei na criação");
        }
        // create new XMLResource; an id will be assigned to the new resource
        
        File f = new File(file);
        if(!f.canRead()) {
            System.out.println("cannot read file " + file);
            return;
        }
        XMLResource document = (XMLResource)col.createResource(f.getName(), "XMLResource");
        
        document.setContent(f);
        System.out.println("storing document " + document.getId() + "...");
        System.out.println( col.getName());
        col.storeResource(document);
        System.out.println("ok.");
    }
}