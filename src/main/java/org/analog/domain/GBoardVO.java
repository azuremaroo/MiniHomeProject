package org.analog.domain;
import java.util.Date;
public class GBoardVO {
	private int gb_no;
	private int g_no;
	private String gb_cmt;
	private Date regdate;
	private Date updatedate;
	public int getGb_no() {
		return gb_no;
	}
	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getGb_cmt() {
		return gb_cmt;
	}
	public void setGb_cmt(String gb_cmt) {
		this.gb_cmt = gb_cmt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
}
