package sec9;

public class Book {
	String name;
	int price;
	String content;
	String intro;
	public Book(){}
	
	public void setname(String n){name=new String(n);}
	public void setprice(int n){price=n;}
	public void setcontent(String n){content=new String(n);}
	public void setintro(String n){intro=new String(n);}
	
	public String getname(){return name;}
	public int getprice(){return price;}
	public String getcontent(){return content;}
	public String getintro(){return intro;}

}
