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
import com.amazonaws.services.ec2.model.CreateSecurityGroupRequest;
import com.amazonaws.services.ec2.model.DescribeImagesResult;
import com.amazonaws.services.ec2.model.DescribeInstancesResult;
import com.amazonaws.services.ec2.model.Instance;
import com.amazonaws.services.ec2.model.Reservation;
import com.amazonaws.services.ec2.model.RunInstancesRequest;
import com.amazonaws.services.ec2.model.StartInstancesRequest;
import com.amazonaws.services.ec2.model.StopInstancesRequest;
import com.amazonaws.services.ec2.model.StopInstancesResult;
import com.amazonaws.services.elasticloadbalancing.model.DescribeInstanceHealthRequest;

public class Instances {

    /*
     * Important: Be sure to fill in your AWS access credentials in the
     *            AwsCredentials.properties file before you try to run this
     *            sample.
     * http://aws.amazon.com/security-credentials
     */

    static AmazonEC2      ec2;
    //ArrayList<String> instances ;

    /**
     * The only information needed to create a client are security credentials
     * consisting of the AWS Access Key ID and Secret Access Key. All other
     * configuration, such as the service endpoints, are performed
     * automatically. Client parameters, such as proxies, can be specified in an
     * optional ClientConfiguration object when constructing a client.
     *
     * @see com.amazonaws.auth.BasicAWSCredentials
     * @see com.amazonaws.auth.PropertiesCredentials
     * @see com.amazonaws.ClientConfiguration
     */
    private static void init() throws Exception {
    	System.out.println("in function init");
        AWSCredentials credentials = new PropertiesCredentials(
        		
        Instances.class.getResourceAsStream("AwsCredentials.properties"));
        

        
        ec2 = new AmazonEC2Client(credentials);
        

        ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
        System.out.println("end init");

    }

    public  Set<Instance> getRunningInstances() throws Exception {

      //  System.out.println("===========================================");
        //System.out.println("Welcome to the AWS Java SDK!");
       // System.out.println("===========================================");
        //String output="";
        init();

        /*
         * Amazon EC2
         *
         * The AWS EC2 client allows you to create, delete, and administer
         * instances programmatically.
         *
         * In this sample, we use an EC2 client to get a list of all the
         * availability zones, and all instances sorted by reservation id.
         */
      
     
        	 
        	
            DescribeInstancesResult describeInstancesRequest = ec2.describeInstances();
            
            
            
            List<Reservation> reservations = describeInstancesRequest.getReservations();
			Set<Instance> instances = new HashSet<Instance>();

            for (Reservation reservation : reservations) {
                instances.addAll(reservation.getInstances());
            }

          //System.out.println("You have " + instances.size() + " Amazon EC2 instance(s) running.");
          //output= output + "You have " + instances.size() + " Amazon EC2 instance(s) running.";
          
          return instances;
          
      
    }
    
    public void stop_instance(String Instance_ID) throws Exception 
    {
    	
    	 
			init();
		
    	List <String >instanceIds =new ArrayList<String>();
    	instanceIds.add(Instance_ID);
    	//StartInstancesRequest str = new StartInstancesRequest(instanceIds);
    	
    	StopInstancesRequest stop = new StopInstancesRequest(instanceIds);
    	stop.setForce(true);
    	
    	StopInstancesResult str = ec2.stopInstances(stop);
    	System.out.println(stop.toString());
    	System.out.println(str.toString());
    
    }
    
    
    public void create_instance(String emi,String keypair) throws Exception
    {
		init();
		RunInstancesRequest rir = new RunInstancesRequest();
		rir.setImageId(emi);
		rir.setKeyName(keypair);	
		rir.setMaxCount(1);
		rir.setMinCount(1);
		ec2.runInstances(rir);
        DescribeInstancesResult describeInstancesRequest = ec2.describeInstances();
    	
    }
    
    
}