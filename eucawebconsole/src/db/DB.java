package db;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;
public class DB {
	
	
	private static DataSource data;// , data1 = null;
	static int timeCounter = 0;
	static boolean isActiveConnectionsWatcherStarted = false;
	protected static Connection conn;
	protected DatabaseMetaData dmd;
	protected ResultSetMetaData rsmd = null;
	protected ResultSet rs;
	protected Statement stmt;
	protected static boolean isSeekingConnectionFirstTime = true;
	protected static boolean isEnteredBMTCFirstTime = true;
	protected static boolean isEnteredCelcabsFirstTime = true;
	protected static int activeConnections;
	static String SPACES = "                           " + "                 ";
	
	private static DB db = new DB();
	
	public DB() {
	}

	public static DB getInstance() {
		return db;
	}
	
	
	
	public void createDatabase(String databaseName) {
		try {
			Statement stmt;

			// Register the JDBC driver for MySQL.
			Class.forName("com.mysql.jdbc.Driver");

			// Define URL of database server for
			// database named mysql on the localhost
			// with the default port number 3306.
			String url = "jdbc:mysql://localhost:3306/mysql";

			// Get a connection to the database for a
			// user named root with a blank password.
			// This user is the default administrator
			// having full privileges to do anything.
			Connection con = DriverManager.getConnection(url,
					DB_Config.user_name,
					DB_Config.password
					);

			// Display URL and connection information
			System.out.println("URL: " + url);
			System.out.println("Connection: " + con);

			// Get a Statement object
			stmt = con.createStatement();

			// Create the new database after 1st dropping it if it exists
			stmt.executeUpdate("drop database if exists " + databaseName);

			stmt.executeUpdate("CREATE DATABASE " + databaseName);
			close(stmt);
			close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}// end catch
	}
	
	
	public static int update(Connection connection, String sql) {
		Statement statement = null;
		int rows = 0;
		try {
			statement = connection.createStatement();
			rows = statement.executeUpdate(sql);
			//MyLog.myIO("updating " + rows + " rows for sql:" + sql + ":");
		} catch (SQLException ex) {
			ex.printStackTrace();
			//MyLog.myCatch("/update() while running sql:" + sql + ":", 79, ex);
		} finally {
			close(statement);
		}
		return rows;
	}
	
	public static Connection getConnection() {
		Connection con = null;
		try {

			if (isSeekingConnectionFirstTime) {
				isSeekingConnectionFirstTime = false;
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException ex) {
					//MyLog.myCatch("/java", 162, ex);
				}
			}
			String connectionUrl = "jdbc:mysql://" + DB_Config.host_name
					+ ":" + DB_Config.port_no + "/"
					+ DB_Config.db_name
					+ "?zeroDateTimeBehavior=convertToNull";
			con = DriverManager.getConnection(connectionUrl,
					DB_Config.user_name, DB_Config.password);
			
			System.out.println("connection successful");
		} catch (SQLException ex) {
			System.out.println("connection Unsuccessful");
			//MyLog.myCatch("/java", 217, ex);
		}
		activeConnections++;
		//MyLog.log("in DBDataStandAlone added new tms conn; total connections:"
			//	+ activeConnections);
		return con;
	}

	
	public static void close(Statement statement) {
		if (statement != null) {
			try {
				statement.close();
				statement = null;
			} catch (SQLException ex) {
				//MyLog.myCatch("/java", 202, ex);
			}
		}
	}

	public static void close(ResultSet rs) {
		// return;
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException ex) {
				
			}
		}
	}

	public static void close(Connection connection) {
		// return;
		if (connection == null) {
			return;
		}
		try {
			if (connection.isClosed()) {
				connection = null;
			} else {
				try {
					connection.close();
					//MyLog.log("closing a conn; total conn:" + activeConnections);
					connection = null;
				} catch (SQLException ex) {
					//MyLog.myCatch("/java", 106, ex);
				}
			}
		} catch (SQLException ex) {
			//MyLog.myCatch("/java", 110, ex);
		}
	}

	
	public static void close(PreparedStatement preparedStmt) {
		if (preparedStmt != null) {
			try {
				preparedStmt.close();
				preparedStmt = null;
			} catch (SQLException ex) {
				
			}
		}
	}

	
	public static ResultSet readFromDB(String query, Connection connection) {
		ResultSet result = null;
		Statement stmt = null;
		try {
			//MyLog.log("in readFromDB with query:\n" + query);
			if ((query.indexOf(" where ") >= 0)
					|| (query.indexOf("count ") >= 0)) {
				// ok
			} else {
				//MyLog.myIO("@@@ please check as query without a where clause!");
			}
			stmt = connection.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			// System.out.println("in readFromDB inside result with query:\n" +
			// query);
			result = stmt.executeQuery(query);
			//MyLog.myIO("readFromDB sql:" + query);
		} catch (SQLException se) {
			//MyLog.myCatch("/java", 66, se);
		}
		return result;
	}
	
}