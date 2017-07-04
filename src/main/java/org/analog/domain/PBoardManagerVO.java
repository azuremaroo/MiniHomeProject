package org.analog.domain;
import java.util.Date;

public class PBoardManagerVO {
	private int pbm_no;
	private String m_id;
	private String pbm_name;
	private int pbm_open;
	private int pbm_cmt_yn;
	private Date regdate;
	private Date updatedate;
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
	public String getPbm_name() {
		return pbm_name;
	}
	public void setPbm_name(String pbm_name) {
		this.pbm_name = pbm_name;
	}
	public int getPbm_open() {
		return pbm_open;
	}
	public void setPbm_open(int pbm_open) {
		this.pbm_open = pbm_open;
	}
	public int getPbm_cmt_yn() {
		return pbm_cmt_yn;
	}
	public void setPbm_cmt_yn(int pbm_cmt_yn) {
		this.pbm_cmt_yn = pbm_cmt_yn;
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
	
	@Override
	public String toString() {
		return "PBoardManagerVO [pbm_no=" + pbm_no + ", m_id=" + m_id + ", pbm_name=" + pbm_name + ", pbm_open="
				+ pbm_open + ", pbm_cmt_yn=" + pbm_cmt_yn + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
}
