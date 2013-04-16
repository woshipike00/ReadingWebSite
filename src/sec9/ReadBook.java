package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ReadBook{
	private int numbers;
	private String WORK_CONTENT;
	private String[] work_name;
	private String[] work_intro;
	private String[] work_price;
public ReadBook(String WorkName) throws ClassNotFoundException, SQLException ,InstantiationException, IllegalAccessException{
	
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);
	Statement sql=connection.createStatement();
	ResultSet result=sql.executeQuery("select * from work where WORK_NAME='"+WorkName+"'");
	while (result.next())
	{
		WORK_CONTENT=result.getString("WORK_CONTENT");
		System.out.print(WORK_CONTENT);
	}
		connection.close();
}
public String getWORK_CONTENT(){
	return WORK_CONTENT;
}
public String getwork_name(int i){
	return work_name[i];
}
public String getIntroduction(int i){
	return work_intro[i];
}
public String getPrice(int i){
	return work_price[i];
}
public static void main(String[] args) throws SQLException, ClassNotFoundException,InstantiationException, IllegalAccessException{
//	workList w=new workList("a");
//	System.out.println(w.getNumbers());
//	System.out.println(w.getwork_name(0));
//	for(int i=0;i<w.getNumbers();i++){
//		System.out.println(i);
//		System.out.println(w.getwork_name(i));
//		System.out.println("######################################");
//		System.out.println(w.getIntroduction(i));
//	}
	ReadBook rb=new ReadBook("english");
	System.out.println(rb.getWORK_CONTENT());
}
}
