package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class regist {
private String userNameRE;
private String passWordRE;
private String introductionRE;
private String is;
public regist(){
	
}
public boolean isExist(String uN) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
	Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	boolean isExist=false;
	if(is.equals("writer")){
		ResultSet result=sql.executeQuery("select * from writer");
		String uName;
		while(result.next() && !isExist){
			uName=result.getString("writer_Name");
			if(uN.equals(uName) ){
				isExist=true;
			}
		}
	}
	else{
		ResultSet result=sql.executeQuery("select * from reader");
		String uName;
		while(result.next() && !isExist){
			uName=result.getString("userName");
			if(uN.equals(uName) ){
				isExist=true;
			}
		}
	}
	connection.close();
	return isExist;
}
public void setUserName(String n){
	userNameRE=n;
}
public void setPassWord(String p){
	passWordRE=p;
}
public void setIntroduction(String i){
	introductionRE=i;
}
public void setIndivi(String i){
	is=i;
}
public String getUserName(){
	return userNameRE;
}
public String getIS(){
	return is;
}
public void setIS(String dd){
	is=dd;
}
public String getPassWord(){
	return passWordRE;
}
public String getIntroduction(){
	return introductionRE;
}
public void registWR() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
	Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	if(is.equals("writer")){
		ResultSet result=sql.executeQuery("select * from writer");
		result.moveToInsertRow();
//		result.updateInt(1,id+1);
		result.updateString(1,userNameRE);
		result.updateString(2,passWordRE);
		result.updateString(3,introductionRE);
		result.updateInt(4,0);
		result.updateInt(5,0);
		result.updateInt(6,0);
		result.insertRow();
		result.close();
	}
	else{
		ResultSet result=sql.executeQuery("select * from reader");
		result.moveToInsertRow();
//		result.updateInt(1,id+1);
		result.updateString(1,userNameRE);
		result.updateString(2,passWordRE);
		result.updateInt(3,0);
		result.updateString(4,introductionRE);
		result.updateString(5," ");
		result.insertRow();
		result.close();
	}

	connection.close();
}
}
