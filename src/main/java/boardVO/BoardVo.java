package boardVO;

import java.sql.Date;

public class BoardVo {
//num / title / userid / nick / content / regdate / cnt
	
	private int num;
	private String title;
	private String userid;
	private String nick;
	private String content;
	private Date regdate;
	private int cnt;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "boardVo [num=" + num + ", title=" + title + ", userid=" + userid + ", nick=" + nick + ", content="
				+ content + ", regdate=" + regdate + ", cnt=" + cnt + "]";
	}
	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVo(int num, String title, String userid, String nick, String content, Date regdate, int cnt) {
		super();
		this.num = num;
		this.title = title;
		this.userid = userid;
		this.nick = nick;
		this.content = content;
		this.regdate = regdate;
		this.cnt = cnt;
	}
	
	
}
