package sec9;

import java.sql.*;

public class submit {
private String uName;
private String pWord;
private int isWriter;
public submit(){
}

public void setUserName(String u){
	uName=u;
}
public String getUserName(){
	return uName;
}
public void setPassWord(String p){
	pWord=p;
}
public String getPassWord(){
	return pWord;
}
public int getWriter(){
	return isWriter;
}
public boolean isRight() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	boolean isRight=false;
	System.out.println(111111);
	System.out.print(uName);
	System.out.println(pWord);
	if(uName.equals("admin") && pWord.equals("admin")){
		isWriter=0;
		isRight=true;
		System.out.println("admmin");
	}
	else{
		Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
		String url="jdbc:db2://localhost:50000/SAMPLE";
		String user="pike";
		String password="8321593";
		Connection connection=DriverManager.getConnection(url,user,password);	Statement sql=connection.createStatement();
		ResultSet result=sql.executeQuery("select * from writer");
		String userName;
		String passWord;
		while(result.next() && !isRight){
			userName=result.getString("writer_NAME").trim();
			passWord=result.getString("writer_PASSWORD").trim();
			if(userName.equals(uName) && passWord.equals(pWord)){
				isRight=true;
				isWriter=1;
				System.out.println("writer");
			}
		}
		result.close();
		ResultSet result2=sql.executeQuery("select * from reader");
		while(result2.next() && !isRight){
			userName=result2.getString("userName");
			passWord=result2.getString("passWord");
			if(userName.equals(uName) && passWord.equals(pWord)){
				isRight=true;
				isWriter=2;
				System.out.println("reader");
			}
		}
		result2.close();
		connection.close();
	}
	
	return isRight;
}
public static void main(String[] args) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
//	submit s=new submit("aaa","aaa");
//	System.out.println(s.isRight());
	
}
}
