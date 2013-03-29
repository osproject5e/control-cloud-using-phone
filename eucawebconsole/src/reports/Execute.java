package reports;

import java.io.IOException;
import java.util.concurrent.Delayed;

import net.schmizz.sshj.AndroidConfig;
import net.schmizz.sshj.SSHClient;
import net.schmizz.sshj.common.IOUtils;
import net.schmizz.sshj.connection.channel.direct.Session;
import net.schmizz.sshj.connection.channel.direct.Session.Command;
import net.schmizz.sshj.transport.TransportException;
import net.schmizz.sshj.userauth.UserAuthException;

public class Execute {

	/**
	 * @param args
	 * @throws TransportException
	 * @throws UserAuthException
	 */
	public String fireCommand(String command) throws Exception{
		final SSHClient ssh = new SSHClient();
		Command cmd = null;
		// Adds a nullHostKeyVerifier
		ssh.addHostKeyVerifier(new NullHostKeyVerifier());

	 
		
		// default port number
		int pn = 22;
		String ipaddress = "192.168.12.25";
		String username = "frontend";
		String password = "iiitb2013";

		// connect to the machine
		try {
		ssh.connect(ipaddress, pn);
		} catch (IOException e) {

		}

		// Authenticate with the password entered
	 	ssh.authPassword(username, password);

		// start a new session
 		final Session session = ssh.startSession();
	 	
	 	cmd = session.exec(command);
	 	
		// reads the output of the command
	 	
		String result = IOUtils.readFully(cmd.getInputStream()).toString();
		//session.join();

		 session.close();
		 ssh.close();
		 return result;
	
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		// creates new SSH client
		Execute e = new Execute();
		String result = e.fireCommand("pwd");
		System.out.println("==================");
		System.out.println(result);
		
		System.out.println("------------------");
		result = e.fireCommand("top > tt.txt");
		System.out.println("==================");
		System.out.println(result);
		System.out.println("------------------");
		result = e.fireCommand("tt.txt");
		System.out.println("==================");
		System.out.println(result);
		System.out.println("------------------");
		result = e.fireCommand("df -Th");
		System.out.println("==================");
		System.out.println(result);
		System.out.println("------------------");
		
			
		
		}
}
