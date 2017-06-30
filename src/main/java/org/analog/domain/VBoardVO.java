package org.analog.domain;
import java.util.Date;
public class VBoardVO {
	private int vb_no;
	private int vbm_no;
	private String vb_content;
	private String vb_img;
	private int vb_viewcnt;
	private Date regdate;
	private Date updatedate;
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
	public String getVb_content() {
		return vb_content;
	}
	public void setVb_content(String vb_content) {
		this.vb_content = vb_content;
	}
	public String getVb_img() {
		return vb_img;
	}
	public void setVb_img(String vb_img) {
		this.vb_img = vb_img;
	}
	public int getVb_viewcnt() {
		return vb_viewcnt;
	}
	public void setVb_viewcnt(int vb_viewcnt) {
		this.vb_viewcnt = vb_viewcnt;
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
