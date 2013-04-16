package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQL {
	public boolean isRight(String uName,String pWord) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection =DriverManager.getConnection("jdbc:mysql://localhost/virtual","root","mcz900303");
		Statement sql=connection.createStatement();
		ResultSet result=sql.executeQuery("select * from writers");
		String userName;
		String passWord;
		boolean isRight=false;
		while(result.next() && !isRight){
			userName=result.getString("userName");
			passWord=result.getString("passWord");
			if(userName.equals(uName) && passWord.equals(pWord)){
				isRight=true;
			}
		}
		connection.close();
		return isRight;
	}
	public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
//		submit s=new submit("AAA","BBB");
//		System.out.println(s.isRight());
		
	}
}
