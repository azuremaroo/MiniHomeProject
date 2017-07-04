package org.analog.domain;
import java.util.Arrays;
import java.util.Date;
public class PBoardVO {
	private int pb_no;
	private int pbm_no;
	private String pb_title;
	private String pb_content;
	private String pb_img;
	private int pb_viewcnt;
	private Date regdate;
	private Date updatedate;
	private String[] files;
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
	public String getPb_title() {
		return pb_title;
	}
	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}
	public String getPb_content() {
		return pb_content;
	}
	public void setPb_content(String pb_content) {
		this.pb_content = pb_content;
	}
	public String getPb_img() {
		return pb_img;
	}
	public void setPb_img(String pb_img) {
		this.pb_img = pb_img;
	}
	public int getPb_viewcnt() {
		return pb_viewcnt;
	}
	public void setPb_viewcnt(int pb_viewcnt) {
		this.pb_viewcnt = pb_viewcnt;
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
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "PBoardVO [pb_no=" + pb_no + ", pb_title=" + pb_title + ", pb_content="
				+ pb_content + ", pbm_no=" + pbm_no + ", regdate=" + regdate
				+ ", pb_viewcnt=" + pb_viewcnt + ", pb_img=" + pb_img + ", files=" + Arrays.toString(files) + "]";
	}
}
