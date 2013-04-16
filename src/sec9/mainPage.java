package sec9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class mainPage {
	private String userName;
private int numberOfWriters;
private String[] namesOfWriters;
private String[] introductionOfWriters;
private String[] worksOfWriters;
private ArrayList<String> list;
public mainPage(String uN) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	userName=uN;
	list=new ArrayList<String>();
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
//	Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	Statement sql=connection.createStatement();
	ResultSet result=sql.executeQuery("select * from writer");
	int number=0;
	while(result.next() )
	{
		if(result.getInt(6)==0)
			number++;
		}
	result.close();
	numberOfWriters=number;
	namesOfWriters=new String[numberOfWriters];
	introductionOfWriters=new String[numberOfWriters];
	worksOfWriters=new String[numberOfWriters];
	number=0;
	String temp;
	Statement sql2=connection.createStatement();
	ResultSet result2=sql2.executeQuery("select * from writer");
	while(result2.next() )
	{
		System.out.println(result2.isClosed());
		namesOfWriters[number]=result2.getString("writer_Name");
		introductionOfWriters[number]=result2.getString("writer_intro");
//		worksOfWriters[number]=result2.getString("list");
		number++;
		}
	result2.close();
	sql.close();
	sql2.close();
	Statement sql3=connection.createStatement();
	ResultSet result3=sql3.executeQuery("select * from reader");
	while(result3.next())
	{
		String tempNN=result3.getString("userName");
		if(tempNN.equals(userName)){
			temp=result3.getString("list");
			StringTokenizer tokenizer = new StringTokenizer(temp);  
	         while (tokenizer.hasMoreTokens()) {  
	             list.add(tokenizer.nextToken());  
	         }  
		}
		
	}
	result3.close();
	connection.close();
}
public String[] getList() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
	String[] temp1=new String[list.size()];
	String[] temp2=new String[3];
	String temp;
	for(int i=0;i<3;i++){
		temp2[i]="0";
	}
	for(int i=0;i<list.size();i++){
		temp1[i]=list.get(i);
	}
	Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();                        //连接数据库            
	String url="jdbc:db2://localhost:50000/SAMPLE";
	String user="pike";
	String password="8321593";
	Connection connection=DriverManager.getConnection(url,user,password);	
	for(int i=0;i<list.size()&&i<3;i++){
		Statement sql=connection.createStatement();
		temp=temp1[i];
		ResultSet result=sql.executeQuery("select * from work");
		while(result.next()){
			String tWriter=result.getString("work_author");
//			tWriter=tWriter.trim();
			String tTitle=result.getString("work_name").trim();
	//		tTitle=tTitle.trim();
			System.out.print(temp);
			System.out.print(tTitle);
			System.out.println(11111111);
			if(tTitle.equals(temp)){
				
				Statement sql2=connection.createStatement();
				ResultSet result2=sql2.executeQuery("select * from work");
				while(result2.next()){
					String tWriter2=result2.getString("work_author");
			//		tWriter2=tWriter2.trim();
//					String tTitle2=result.getString("title");
	//				System.out.print(tWriter2);
	//				System.out.println(tWriter);
					if(tWriter2.equals(tWriter)){
						temp2[i]=result2.getString("work_name");
						
		//				System.out.println('d');
					}
				}
			}
		}
	}
	connection.close();
	return temp2;
}
public void setUserName(String n){
	userName=new String(n);
}
public int getListSize(){
	return list.size();
}
public int getNumberOfWriters(){
	return numberOfWriters;
}
public String getName(int i){
	return namesOfWriters[i];
}
public String getIntroduction(int i){
	return introductionOfWriters[i];
}
public String getWorks(int i){
	return worksOfWriters[i];
}
}
