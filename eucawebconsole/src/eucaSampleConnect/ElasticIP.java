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
import com.amazonaws.services.ec2.model.Address;
import com.amazonaws.services.ec2.model.AllocateAddressRequest;
import com.amazonaws.services.ec2.model.AssociateAddressRequest;
import com.amazonaws.services.ec2.model.CreateSecurityGroupRequest;
import com.amazonaws.services.ec2.model.DescribeAddressesRequest;
import com.amazonaws.services.ec2.model.DescribeAddressesResult;
import com.amazonaws.services.ec2.model.DescribeImagesResult;
import com.amazonaws.services.ec2.model.DescribeInstancesResult;
import com.amazonaws.services.ec2.model.Image;
import com.amazonaws.services.ec2.model.Instance;
import com.amazonaws.services.ec2.model.Reservation;
import com.amazonaws.services.ec2.model.RunInstancesRequest;
import com.amazonaws.services.ec2.model.StartInstancesRequest;
import com.amazonaws.services.ec2.model.StopInstancesRequest;
import com.amazonaws.services.ec2.model.StopInstancesResult;
import com.amazonaws.services.elasticloadbalancing.model.DescribeInstanceHealthRequest;

public class ElasticIP extends CLConnection {

    /*
     * Important: Be sure to fill in your AWS access credentials in the
     *            AwsCredentials.properties file before you try to run this
     *            sample.
     * http://aws.amazon.com/security-credentials
     */

/*    static AmazonEC2      ec2;
    //ArrayList<String> instances ;

    private static void init() throws Exception {
    	System.out.println("in function init");
        AWSCredentials credentials = new PropertiesCredentials(
        		
        ElasticIP.class.getResourceAsStream("AwsCredentials.properties"));
        

        
        ec2 = new AmazonEC2Client(credentials);
        

        ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
        System.out.println("end init");
        

    }
  */  public List<Address> listAddress() throws Exception
    { 
    	init();
    	DescribeAddressesResult dar = ec2.describeAddresses();    	
     	List<Address> add = dar.getAddresses();
     	System.out.println("===============");
     	System.out.println(add.toString());
     	return add;
    } 
    public void associateIp(String instanceId, String  publicIp) throws Exception
    { 
    	init();
    	AssociateAddressRequest aar = new AssociateAddressRequest(instanceId, publicIp);
    	System.out.println("publicIp in java file : "+publicIp);
    	try{
    	ec2.associateAddress(aar);    	
    	}
    	catch(Exception e){
    		System.out.println(e);
    	}
     	//return add;
    } 
public static void main(String a[]) throws Exception
{
	
	 ElasticIP eip = new ElasticIP();
	 System.out.println(eip.listAddress().toString());
	eip.associateIp("i-A29143BA", "192.168.12.201");
	
	}
       
}