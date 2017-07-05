package org.analog.persistence;

import org.analog.domain.MemberVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO vo);
	
	public void updateIntro(MemberVO vo);

	public String viewIntro(String m_id);

	public MemberVO readUser(String m_id);

	public int checkId(String m_id);

}
