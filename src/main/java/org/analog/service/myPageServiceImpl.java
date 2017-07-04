package org.analog.service;

import java.util.List;

import javax.inject.Inject;

import org.analog.domain.GuestVO;
import org.analog.domain.MemberVO;
import org.analog.domain.PBoardManagerVO;
import org.analog.domain.VBoardManagerVO;
import org.analog.persistence.GuestDAO;
import org.analog.persistence.MemberDAO;
import org.analog.persistence.PBoardManagerDAO;
import org.analog.persistence.VBoardManagerDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class myPageServiceImpl implements myPageService {

	
	@Inject
	private MemberDAO dao;
	
	@Inject
	private PBoardManagerDAO pbdao;
	
	@Inject
	private VBoardManagerDAO vbdao;
	
	@Inject
	private GuestDAO guestdao;

	@Override
	public MemberVO readUser(String m_id) throws Exception {
		return dao.readUser(m_id);
	}

	@Override
	public GuestVO readGuest(String m_id) throws Exception {
		return guestdao.selectGuest(m_id);
	}

	@Override
	public List<PBoardManagerVO> readPBoard(String m_id) throws Exception {
		return pbdao.selectPBorad(m_id);
	}

	@Override
	public List<VBoardManagerVO> readVBoard(String m_id) throws Exception {
		return vbdao.selectVBorad(m_id);
	}
	

}
