package org.analog.service;

import org.analog.domain.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO vo) throws Exception;

	public void updateIntro(MemberVO vo) throws Exception;

	public String viewIntro(String m_id) throws Exception;

	public int isMember(String m_id, String m_pw) throws Exception;

	public MemberVO readUser(String m_id) throws Exception;
	
	public int checkId(String m_id) throws Exception;

}
