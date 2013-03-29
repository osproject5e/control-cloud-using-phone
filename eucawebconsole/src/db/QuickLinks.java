package db;

import java.sql.Connection;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;
 

public class QuickLinks {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
			DB_Config db = new DB_Config();
			Connection con = db.registerDB();
			Statement s = con.createStatement();
			
			String query="select * from login";
			s.executeQuery(query);
	}

}
