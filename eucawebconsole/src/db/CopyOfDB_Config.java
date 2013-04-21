package db;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class CopyOfDB_Config {
	/* for accessing database and producing results */
	private String db_name;
	private String prefix;
	private int port_no;
	private  String host_name;
	private String user_name;
	private String password;
	protected Connection conn;
	protected DatabaseMetaData dmd;
	protected ResultSetMetaData rsmd = null;
	protected ResultSet rs;
	protected Statement stmt;	
	
	
	public CopyOfDB_Config() {
		super();
		
		/*
		 *  	Write a code to fetch all this fields from config.xml
		 */
		db_name = "euca";
		prefix = "";
		port_no = 3306;
		host_name = "localhost";
		user_name = "root";
		password ="admin";
	}


	public CopyOfDB_Config(String db_name, String prefix, int port_no,
			String host_name, String user_name, String password) {
		super();
		this.db_name = db_name;
		this.prefix = prefix;
		this.port_no = port_no;
		this.host_name = host_name;
		this.user_name = user_name;
		this.password = password;
	}

	//function used for establishing the connection and defining the database name and table prefix
	public Connection registerDB() {
		Connection con = null;
		//DB_Config db=new DB_Config();
		try{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException ex) {
				System.out.println("Class Not found exception"+ex);
			}
			String connectionUrl = "jdbc:mysql://" +host_name
					+ ":" + port_no + "/"
					+db_name
					+ "?zeroDateTimeBehavior=convertToNull";
			System.out.println(connectionUrl);
			con = DriverManager.getConnection(connectionUrl,
				user_name, password);
		} catch (SQLException ex) {
			System.out.println("Cannot connect to database"+ex);
		}	
		return con;
	}


}
