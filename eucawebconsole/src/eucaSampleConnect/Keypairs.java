package eucaSampleConnect;

 
import java.util.List;
 

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.*;

public class Keypairs extends CLConnection {

	/*
	 * Important: Be sure to fill in your AWS access credentials in the
	 * AwsCredentials.properties file before you try to run this sample.
	 * http://aws.amazon.com/security-credentials
	 */

	/*static AmazonEC2 ec2;

	// ArrayList<String> instances ;
	private static void init() throws Exception {
		System.out.println("in function init");
		AWSCredentials credentials = new PropertiesCredentials(

				Instances.class
						.getResourceAsStream("AwsCredentials.properties"));

		ec2 = new AmazonEC2Client(credentials);

		ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
		System.out.println("end init");

	}
*/
	public String CreateKeypair(String Keyname) throws Exception
    {
    	 
        	init();
        	CreateKeyPairRequest kpr = new CreateKeyPairRequest();
        	kpr.setKeyName(Keyname);
        	//kpr.setRequestCredentials(credentials);
        	CreateKeyPairResult result = ec2.createKeyPair(kpr);        	
        	//System.out.println(result.getKeyPair());        
        	return "Keypair created";
        	
   
    	    	
    }

	public List<KeyPairInfo> listKeypair() throws Exception {
	 
			init();
			// kpr.setRequestCredentials(credentials);

			DescribeKeyPairsResult kpr = ec2.describeKeyPairs();
			List<KeyPairInfo> keys = kpr.getKeyPairs();

			return keys;
	 
 
	}
	public String DeleteKeypair(String Keyname) throws Exception {
		init();
		DeleteKeyPairRequest kpr = new DeleteKeyPairRequest();
		kpr.setKeyName(Keyname);
		ec2.deleteKeyPair(kpr);
		return "Keypair deleted";
		}
	public static void main(String s[]) {
	}
}