package eXistPackage;

import java.io.Serializable;
import java.util.Hashtable;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpc;
import org.apache.xmlrpc.XmlRpcClient;

public class Retrieve {

	protected final static String uri = 
	    "http://localhost:8080/exist/xmlrpc";

	protected static void usage() {
	    System.out.println( "usage: org.exist.examples.xmlrpc.Retrieve " +
	        "path-to-document" );
	    System.exit( 0 );
	}

	public static void main( String args[] ) throws Exception {
	    if ( args.length < 1 ) {
	        usage();
	    }
	    XmlRpc.setEncoding("UTF-8");
	    XmlRpcClient xmlrpc = new XmlRpcClient( uri );
	    xmlrpc.setBasicAuthentication("admin", "keyword");
	    Hashtable<String, String> options = new Hashtable<String, String>();
	    options.put("indent", "yes");
	    options.put("encoding", "UTF-8");
	    options.put("expand-xincludes", "yes");
	    options.put("highlight-matches", "elements");
	    
	    Vector<Serializable> params = new Vector<Serializable>();
	    params.addElement( args[0] ); 
	    params.addElement( options );
	    String xml = (String)
	        xmlrpc.execute( "getDocumentAsString", params );
	    System.out.println( xml );
	}
	}