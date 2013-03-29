package eucaSampleConnect;

import java.util.*;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.DescribeImagesResult;
import com.amazonaws.services.ec2.model.Image;

public class EucaImages extends CLConnection {

    /*
     * Important: Be sure to fill in your AWS access credentials in the
     *            AwsCredentials.properties file before you try to run this
     *            sample.
     * http://aws.amazon.com/security-credentials
     */
/*
    static AmazonEC2      ec2;
    //ArrayList<String> instances ;

    
    private static void init() throws Exception {
    	System.out.println("in function init");
        AWSCredentials credentials = new PropertiesCredentials(
        		
        Instances.class.getResourceAsStream("AwsCredentials.properties"));
        

        
        ec2 = new AmazonEC2Client(credentials);
        

        ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
        System.out.println("end init");
        
        
       
    }
  */  
    public 	List<Image> getImages() throws Exception
    {
    	
     
    	init();
    	
       	DescribeImagesResult dir = ec2.describeImages();
       	
       	List<Image> img = dir.getImages();
       	
    	//output =("images="+dir.toString());
       	return img;
 
    }


}
