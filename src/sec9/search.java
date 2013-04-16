package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class search {
private String target;
private String[] returns;
public search(String t) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	boolean flag=false;
	returns=new String[2];
	target=t;
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
//	Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	Statement sql=connection.createStatement();
	ResultSet result=sql.executeQuery("select * from writer");
	while(result.next()   && !flag){
		String temp=result.getString("writer_Name");
		if(temp.equals(target)){
			returns[0]="作者";
			returns[1]=temp;
			flag=true;
		}
	}
	result.close();
	Statement sql2=connection.createStatement();
	ResultSet result2=sql2.executeQuery("select * from work");
	while(result2.next()   && !flag){
		String temp=result2.getString("work_name");
		if(temp.equals(target)){
			returns[0]="作品";
			returns[1]=temp;
			flag=true;
		}
	}
	result2.close();
	if(!flag){
		returns[0]="未找到";
		returns[1]="未找到";
	}
	
}
public String getReturns(int i){
	return returns[i];
}
}
