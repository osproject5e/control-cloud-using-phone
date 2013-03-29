package eucaSampleConnect;

import java.util.List;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.Address;
import com.amazonaws.services.ec2.model.CreateSecurityGroupRequest;
import com.amazonaws.services.ec2.model.CreateSecurityGroupResult;
import com.amazonaws.services.ec2.model.DeleteSecurityGroupRequest;
import com.amazonaws.services.ec2.model.DescribeAddressesResult;
import com.amazonaws.services.ec2.model.DescribeSecurityGroupsRequest;
import com.amazonaws.services.ec2.model.DescribeSecurityGroupsResult;
import com.amazonaws.services.ec2.model.SecurityGroup;

public class SecurityGroups extends CLConnection {
	/*static AmazonEC2 ec2;
	
	private static void init() throws Exception {
    	System.out.println("in function init");
        AWSCredentials credentials = new PropertiesCredentials(
        SecurityGroups.class.getResourceAsStream("AwsCredentials.properties"));		
        
        ec2 = new AmazonEC2Client(credentials);
        ec2.setEndpoint("http://192.168.12.25:8773/services/Eucalyptus");
        System.out.println("end init");
    }
	*/
	public List<SecurityGroup> listSecurityGroups() throws Exception
    { 
    	init();
    	DescribeSecurityGroupsResult dsgr = ec2.describeSecurityGroups();
     	List<SecurityGroup> sg = dsgr.getSecurityGroups();
    	
     	return sg;
    }
	
	public String CreateSecurityGroup(String secGroupName, String secGroupDesc) throws Exception
    { 
    	init();
    	CreateSecurityGroupRequest csgr = new CreateSecurityGroupRequest();
    	csgr.setGroupName(secGroupName);
    	csgr.setDescription(secGroupDesc);
    	CreateSecurityGroupResult result = ec2.createSecurityGroup(csgr);
     	return "Security Group created";
    }
	
	public String DeleteSecurityGroup(String secGroupName) throws Exception
	{
		init();
		DeleteSecurityGroupRequest dsgr = new DeleteSecurityGroupRequest();
		dsgr.setGroupName(secGroupName);
		ec2.deleteSecurityGroup(dsgr);
		return "Security Group deleted";
	}
}
