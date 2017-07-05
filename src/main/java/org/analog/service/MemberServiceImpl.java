package org.analog.service;

import javax.inject.Inject;

import org.analog.domain.MemberVO;
import org.analog.persistence.GuestDAO;
import org.analog.persistence.MemberDAO;
import org.analog.persistence.PBoardManagerDAO;
import org.analog.persistence.VBoardManagerDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class MemberServiceImpl implements MemberService {

	
	@Inject
	private MemberDAO dao;
	
	@Inject
	private PBoardManagerDAO pbdao;
	
	@Inject
	private VBoardManagerDAO vbdao;
	
	@Inject
	private GuestDAO guestdao;
	

	@Transactional
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		dao.insertMember(vo);
		
		String bm_name = "기본앨범";
		
		pbdao.createPBorad(vo.getM_id(), bm_name);
		vbdao.createVBorad(vo.getM_id(), bm_name);
		guestdao.createGuest(vo.getM_id());

	}


	@Override
	public void updateIntro(MemberVO vo) throws Exception {
		dao.updateIntro(vo);
		
	}
	
	@Override
	public String viewIntro(String m_id) throws Exception {
		
		return dao.viewIntro(m_id);
		
	}


	@Override
	public MemberVO readUser(String m_id) throws Exception {
		
		return dao.readUser(m_id);
	}

	@Override
	public int isMember(String m_id, String m_pw) throws Exception {
		int rs=-1;
		MemberVO rvo = dao.readUser(m_id);
		
		if(rvo != null ){
			if(rvo.getM_pw().equals(m_pw)) rs = 1; // 패스워드 일치
			else rs=0; // 패스원드 불일치
		}
		else
			rs = -1 ; // 존재하지 않음.
		
		return rs;
	}


	@Override
	public int checkId(String m_id) throws Exception {
		return dao.checkId(m_id);
	}


}
