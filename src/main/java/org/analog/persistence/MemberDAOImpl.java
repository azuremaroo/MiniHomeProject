package org.analog.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.analog.domain.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//---------------------------------------------

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "org.analog.mappers.memberMappers";

	// ----------------------------------------------------------

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert(namespace + ".insertMember", vo);

	}

	@Override
	public void updateIntro(MemberVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".updateIntro", vo);
	}

	@Override
	public String viewIntro(String m_id) {
		return sqlSession.selectOne(namespace + ".viewIntro", m_id);
		
	}


	@Override
	public MemberVO readUser(String m_id) {
		return  sqlSession.selectOne(namespace+".selectMember", m_id);
	}

	@Override
	public int checkId(String m_id) {
		return sqlSession.selectOne(namespace+".checkId", m_id);
	}


}
