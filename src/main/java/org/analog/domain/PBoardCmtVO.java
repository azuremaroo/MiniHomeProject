package org.analog.domain;
import java.util.Date;
public class PBoardCmtVO {
	private int pbc_no;
	private int pb_no;
	private int pbm_no;
	private String m_id;
	private String m_name;
	private String pbc_cmt;
	private Date regdate;
	private Date updatedate;
	public int getPbc_no() {
		return pbc_no;
	}
	public void setPbc_no(int pbc_no) {
		this.pbc_no = pbc_no;
	}
	public int getPb_no() {
		return pb_no;
	}
	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	public int getPbm_no() {
		return pbm_no;
	}
	public void setPbm_no(int pbm_no) {
		this.pbm_no = pbm_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getPbc_cmt() {
		return pbc_cmt;
	}
	public void setPbc_cmt(String pbc_cmt) {
		this.pbc_cmt = pbc_cmt;
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
