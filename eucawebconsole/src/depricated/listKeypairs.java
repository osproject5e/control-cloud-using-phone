package depricated;
/*
package eucaSampleConnect;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.*;

public class listKeypairs {
  private static void init() throws Exception {
    	System.out.println("in function init");
        AWSCredentials credentials = new PropertiesCredentials(
        		
        AWSCheckRunnigInstances.class.getResourceAsStream("AwsCredentials.properties"));
        

        
        ec2 = new AmazonEC2Client(credentials);
        

        ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
        System.out.println("end init");
     
        
        
    }
    
    public void CreateKeypair(String Keyname)
    {
    	try{
        	init();
        	CreateKeyPairRequest kpr = new CreateKeyPairRequest();
        	kpr.setKeyName(Keyname);
        	//kpr.setRequestCredentials(credentials);
        	CreateKeyPairResult result = ec2.createKeyPair(kpr);        	
        	//System.out.println(result.getKeyPair());        
        	
        	}
        	catch(Exception ex)
        	{
        		
        		
        	}
     	
    	
    }
    
    public static void main(String s[])
    {
       }
}*/