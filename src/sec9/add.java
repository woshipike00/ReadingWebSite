package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class add {
public add(String u,int m) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);
	Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet result=sql.executeQuery("select * from reader");
	String temp;
	int mm;
	while (result.next()){
		temp=result.getString("userName");
		mm=result.getInt("integral");
		if(temp.equals(u)){
			System.out.println("add");
			result.updateInt(3,mm+m);
			result.updateRow();
		}
	}
	result.close();
	connection.close();
}
}
