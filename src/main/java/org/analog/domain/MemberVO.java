package org.analog.domain;

public class MemberVO {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private int m_phone;
	private int m_birth;
	private String m_photo;
	private String m_title;
	private String m_intro;
	
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_phone() {
		return m_phone;
	}
	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_birth() {
		return m_birth;
	}
	public void setM_birth(int m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	
	@Override
	public String toString() {
		return "MemberVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_phone=" + m_phone
				+ ", m_birth=" + m_birth + ", m_photo=" + m_photo + ", m_title=" + m_title + ", m_intro=" + m_intro
				+ "]";
	}
	

}
