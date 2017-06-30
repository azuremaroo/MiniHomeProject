package org.analog.domain;
import java.util.Date;
public class GuestVO {
	private int g_no;
	private String m_id;
	private int g_open;
	private Date regdate;
	private Date updatedate;
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getG_open() {
		return g_open;
	}
	public void setG_open(int g_open) {
		this.g_open = g_open;
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
