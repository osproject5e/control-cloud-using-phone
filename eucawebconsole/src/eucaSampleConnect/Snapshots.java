package eucaSampleConnect;

import java.util.List;

import com.amazonaws.services.ec2.model.*;

public class Snapshots extends CLConnection {
		
	public List<Snapshot>  listSnapshots() throws Exception
	{
		init();
		
		DescribeSnapshotsResult dsr =  ec2.describeSnapshots();
		
		List <Snapshot> snap = dsr.getSnapshots();
		
		return snap;			
	}
	
	public CreateSnapshotResult createSnapshots(String volumeId, String description) throws Exception
	{
		init();
		CreateSnapshotRequest csr = new CreateSnapshotRequest(volumeId, description);
		CreateSnapshotResult csres = ec2.createSnapshot(csr);
		return csres;		
	}
	
	public int deleteSnapshots (String snapshotId) throws Exception
	{
		init();
		DeleteSnapshotRequest dsreq = new DeleteSnapshotRequest(snapshotId);
		ec2.deleteSnapshot(dsreq);
		return 1;
	}
	public void createVolumeFromSnapshots(String snapshotId) throws Exception
	{
		init();
		CreateVolumeRequest cvr = new CreateVolumeRequest(snapshotId, "CLUSTER01");
		ec2.createVolume(cvr);
		
	}
	public static void main(String a[]) throws Exception
	{
		init();
		//ec2.describeSnapshots().
		
	}

}
