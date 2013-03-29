package eucaSampleConnect;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;

public class CLConnection {
	
/*	  static AmazonEC2      ec2;
	    //ArrayList<String> instances ;

	    protected static void init() throws Exception {
	    	System.out.println("in function init");
	        AWSCredentials credentials = new PropertiesCredentials(
	        		
	        Instances.class.getResourceAsStream("AwsCredentials.properties"));
	        

	        
	        ec2 = new AmazonEC2Client(credentials);
	        

	        ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
	        System.out.println("end init");
	       
	    }
*/
    AmazonEC2      ec2;
    
    
  protected   void init() throws Exception {
  	
  	String secretKey="LwNuHeQ3NcwhrJh59UyzgL6nSxXDUWkh2upHd5Ae";
  	String 	accessKey="KGTRBZ8D22LEHC6XCH4QM";
  	//System.out.println("in function init");
  	AWSCredentials credentials =  new BasicAWSCredentials(accessKey,secretKey ) ;
  	//PropertiesCredentials(ElasticIP.class.getResourceAsStream("AwsCredentials.properties"));
              
      ec2 = new AmazonEC2Client(credentials);
      

      ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
      System.out.println("end init");
      

  }
	
}
