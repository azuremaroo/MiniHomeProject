package org.analog.domain;
import java.util.Date;
public class VBoardManagerVO {
	private int vbm_no;
	private String m_id;
	private String vbm_name;
	private int vbm_open;
	private int vbm_cmt_yn;
	private Date regdate;
	private Date updatedate;
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
	public String getVbm_name() {
		return vbm_name;
	}
	public void setVbm_name(String vbm_name) {
		this.vbm_name = vbm_name;
	}
	public int getVbm_open() {
		return vbm_open;
	}
	public void setVbm_open(int vbm_open) {
		this.vbm_open = vbm_open;
	}
	public int getVbm_cmt_yn() {
		return vbm_cmt_yn;
	}
	public void setVbm_cmt_yn(int vbm_cmt_yn) {
		this.vbm_cmt_yn = vbm_cmt_yn;
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
