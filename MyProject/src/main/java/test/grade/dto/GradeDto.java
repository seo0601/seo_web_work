package test.grade.dto;

public class GradeDto {
	   private String name; 
	   private String javascript; 
	   private String java; 
	   private String oracle; 
	   
	   public GradeDto() {}

	public GradeDto(String name, String javascript, String java, String oracle) {
		super();
		this.name = name;
		this.javascript = javascript;
		this.java = java;
		this.oracle = oracle;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJavascript() {
		return javascript;
	}

	public void setJavascript(String javascript) {
		this.javascript = javascript;
	}

	public String getJava() {
		return java;
	}

	public void setJava(String java) {
		this.java = java;
	}

	public String getOracle() {
		return oracle;
	}

	public void setOracle(String oracle) {
		this.oracle = oracle;
	}
	   
	   
}
