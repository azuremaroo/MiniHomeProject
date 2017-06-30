package org.analog.domain;
import java.util.Date;
public class VBoardCmtVO {
	private int vbc_no;
	private int vb_no;
	private int vbm_no;
	private String m_id;
	private String m_name;
	private String vbc_cmt;
	private Date regdate;
	private Date updatedate;
	public int getVbc_no() {
		return vbc_no;
	}
	public void setVbc_no(int vbc_no) {
		this.vbc_no = vbc_no;
	}
	public int getVb_no() {
		return vb_no;
	}
	public void setVb_no(int vb_no) {
		this.vb_no = vb_no;
	}
	public int getVbm_no() {
		return vbm_no;
	}
	public void setVbm_no(int vbm_no) {
		this.vbm_no = vbm_no;
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
	public String getVbc_cmt() {
		return vbc_cmt;
	}
	public void setVbc_cmt(String vbc_cmt) {
		this.vbc_cmt = vbc_cmt;
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
