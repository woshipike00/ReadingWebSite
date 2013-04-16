package sec9;

import java.sql.*;
public class DataBase {
	public static void main(String[] args) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver loader");
		Connection connection =DriverManager.getConnection("jdbc:mysql://localhost/virtual","root","mcz900303");
		System.out.println("Satabase connected");
		Statement sql=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		sql.execute("drop table if exists writers");
		sql.execute("create table writers(id int not null auto_increment,userName varchar(100) ,passWord varchar(100) ,integral int ,introduction varchar(100) ,list varchar(100),primary key(id))");
		sql.execute("insert writers values(1,'AAA','AAA',100,'我真的不是朱荣飞！真的！','YY4 YY6 YY7')");
		sql.execute("insert writers values(2,'BBB','BBB',100,'我真的不是赵俊！真的！','YY1 YY2 YY3')");	
		
		sql.execute("drop table if exists readers");
		sql.execute("create table readers(id int not null auto_increment,userName varchar(100) ,passWord varchar(100) ,integral int ,introduction varchar(100) ,list varchar(100),primary key(id))");
		sql.execute("insert readers values(1,'CCC','CCC',100,'我真的不是朱荣飞！真的！','YY1 YY7 YY4')");
		sql.execute("insert readers values(2,'DDD','DDD',100,'我真的不是赵俊！真的！','YY1 YY2 YY3')");	
		
		sql.execute("drop table if exists works");
		sql.execute("create table works(id int not null auto_increment,title varchar(100) ,writer varchar(100) ,introduction varchar(100) ,primary key(id))");
		sql.execute("insert works values(1,'YY1','AAA','OOXXOOXXOOXXOOXX')");
		sql.execute("insert works values(2,'YY2','AAA','OOXXOOXXOOXXOOXX')");	
		sql.execute("insert works values(3,'YY3','AAA','OOXXOOXXOOXXOOXX')");
		sql.execute("insert works values(4,'YY4','BBB','OOXXOOXXOOXXOOXX')");
		sql.execute("insert works values(5,'YY5','BBB','OOXXOOXXOOXXOOXX')");
		sql.execute("insert works values(6,'YY6','BBB','OOXXOOXXOOXXOOXX')");
		sql.execute("insert works values(7,'YY7','BBB','OOXXOOXXOOXXOOXX')");
		
		System.out.println("Data Set");
	}
}

