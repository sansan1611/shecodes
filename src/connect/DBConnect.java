package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static String DB_URL = "jdbc:mysql://localhost:3306/corona?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static String USER_NAME = "root";
	private static String PASSWORD = "";

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
