package sec9;

import java.sql.*;
public class DBBean {
	private Connection con;
	
	public DBBean() throws Exception{
		initializejdbc();
	}
	
	public void initializejdbc() throws Exception{
		try {
			//System.out.println("begin");
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
			String url="jdbc:db2://localhost:50000/SAMPLE";
			String user="pike";
			String password="8321593";
			con=DriverManager.getConnection(url,user,password);
			System.out.print("connection done\n");
			//stmt=conn.createStatement();

		} catch (SQLException sqle) {
			System.out.print(sqle);
		}
	}
	public ResultSet query (String s) throws SQLException{
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(s);
		return rs;
	}
	
	public void update (String s) throws SQLException{
		Statement stmt=con.createStatement();
		stmt.executeUpdate(s);
	}
	
	public void execute(String s) throws SQLException{
		Statement stmt=con.createStatement();
		stmt.execute(s);
	}

}
