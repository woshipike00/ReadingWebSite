package sec9;

public class Writer {
	private String name;
	private String password;
	private String intro;
	private int point;
	private int index;
	private int cleared;
	
	public Writer(){
		
	}
	public void setname(String n){
		name=new String(n);
	}
	public void setpassword(String n){
		password=new String(n);
	}
	public void setintro(String n){
		intro=new String(n);
	}
	
	public String getname(){
		return name;
	}
	public String getpassword(){
		return password;
	}
	public String getintro(){
		return intro;
	}
	public int getpoint(){
		return point;
	}
	public int getindex(){
		return index;
	}
	public int getcleared(){
		return cleared;
	}
	
	

}
