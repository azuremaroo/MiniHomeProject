package org.analog.service;

import java.util.List;

import org.analog.domain.GuestVO;
import org.analog.domain.MemberVO;
import org.analog.domain.PBoardManagerVO;
import org.analog.domain.VBoardManagerVO;

public interface myPageService {

	public MemberVO readUser(String m_id) throws Exception;
	public GuestVO readGuest(String m_id) throws Exception;
	public List<PBoardManagerVO> readPBoard(String m_id) throws Exception;
	public List<VBoardManagerVO> readVBoard(String m_id) throws Exception;

}
