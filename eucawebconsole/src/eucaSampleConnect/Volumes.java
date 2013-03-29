package eucaSampleConnect;

import com.amazonaws.services.ec2.model.AttachVolumeRequest;
import com.amazonaws.services.ec2.model.CreateVolumeRequest;
import com.amazonaws.services.ec2.model.CreateVolumeResult;
import com.amazonaws.services.ec2.model.DeleteVolumeRequest;
import com.amazonaws.services.ec2.model.DescribeVolumesResult;
import com.amazonaws.services.ec2.model.DetachVolumeRequest;

import java.util.*;
 
public class Volumes extends CLConnection {
	
	public List<com.amazonaws.services.ec2.model.Volume> listVolumes () throws Exception
	{
		init();
		DescribeVolumesResult dvr = ec2.describeVolumes();
		List<com.amazonaws.services.ec2.model.Volume> vol = dvr.getVolumes();

		return vol;
		
	}
	
	public CreateVolumeResult createVolumes(int sizeInGB,String availabilityZone) throws Exception
	{
		init();
		CreateVolumeRequest cvreq = new CreateVolumeRequest(sizeInGB, availabilityZone);
		CreateVolumeResult cvres = ec2.createVolume(cvreq); 
		return cvres;
	}
	
	public void deleteVolumes(String volumeID)throws Exception
	{
		init();
		DeleteVolumeRequest dvr = new DeleteVolumeRequest(volumeID);
		ec2.deleteVolume(dvr);		
	}
	public void attachVol(String volID,String insID) throws Exception
	{
		init();
	    AttachVolumeRequest avr = new AttachVolumeRequest(volID, insID, "/dev/sda6");
		ec2.attachVolume(avr);
	}
	
	public void detachVol(String volID) throws Exception
	{
		init();
		DetachVolumeRequest dvr = new DetachVolumeRequest(volID);
		ec2.detachVolume(dvr);
	}
	
	public static void main(String a[]) 
	{
		
		//createVolumes(1,"CLUSTER01");
	/*	init();
		
		
		
		DescribeVolumesResult dvr = ec2.describeVolumes();
		List<com.amazonaws.services.ec2.model.Volume> vol = dvr.getVolumes();
		Iterator<com.amazonaws.services.ec2.model.Volume> it = vol.iterator();
		
		while(it.hasNext())
		{
			System.out.println(it.next().toString());
			
		}
		
	*/	
	}
}
