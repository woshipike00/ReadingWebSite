package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class workList {
	private int numbers;
	private String writerName;
	private String[] work_name;
	private String[] work_intro;
	private String[] work_price;
	private String[] work_point;
public workList(String wName) throws ClassNotFoundException, SQLException ,InstantiationException, IllegalAccessException{
	writerName=wName;
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);
	Statement sql=connection.createStatement();
	ResultSet result=sql.executeQuery("select * from work");
	int i=0;
	while(result.next()){
		String temp=result.getString("work_author");
		if(temp.equals(writerName))
			i++;
	}
	result.close();
	numbers=i;
	System.out.println(numbers);
	ResultSet result2=sql.executeQuery("select * from work");
	System.out.println(numbers);
	work_name=new String[numbers];
	work_intro=new String[numbers];
	work_price=new String[numbers];
	work_point=new String[numbers];
	i=0;
	while(result2.next()){
		String temp=result2.getString("work_author");
		if(temp.equals(writerName)){
		    work_name[i]=result2.getString("work_name");
		    work_intro[i]=result2.getString("work_intro");
		    work_price[i]=result2.getString("work_price");
		    work_point[i]=result2.getString("work_PRESSNUM");
		    i++;
//		    System.out.println("yici");
		}

	}
	connection.close();
}
public int getNumbers(){
	return numbers;
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
public String getPoint(int i){
	return work_point[i];
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
}
}
