package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class readerPage {
private String userName;
private String passWord;
private int integral;
private String introduction;
public readerPage(String uN) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	System.out.println("reader");
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
	Statement sql=connection.createStatement();
	ResultSet result=sql.executeQuery("select * from reader");
	String temp;
	while(result.next()){
		temp=result.getString("userName");
		if(temp.equals(uN)){
			userName=temp;
			passWord=result.getString("passWord");
			integral=result.getInt("integral");
			introduction=result.getString("introduction");
			System.out.println(introduction);
			
		}
	}
}
public void setUserName(String n){
	userName=n;
}
public void setPassWord(String p){
	passWord=p;
}
public void setIntegral(int i){
	integral=i;
}
public void setIntroduction(String i){
	introduction=i;
}
public String getUserName(){
	return userName;
}
public String getPassWord(){
	return passWord;
}
public int getIntegral(){
	return integral;
}
public String getIntroduction(){
	return introduction;
}
public void done() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
	Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet result=sql.executeQuery("select * from reader");
	String temp;
	while (result.next()){
		temp=result.getString("userName");
		if(temp.equals(userName)){
			result.updateString(1,userName);
			result.updateString(2,passWord);
			result.updateInt(3,integral);
			result.updateString(4,introduction);
			result.updateRow();
		}
	}
	result.close();
	connection.close();
}
}
