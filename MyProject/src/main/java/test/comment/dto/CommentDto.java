package test.comment.dto;

public class CommentDto {
	private int comment_num;
	private String id;
	private String content;
	private String regdate;
	
	public CommentDto() {}

	public CommentDto(int comment_num, String id, String content, String regdate) {
		super();
		this.comment_num = comment_num;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
