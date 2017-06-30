package org.analog.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAOImpl implements GuestDAO {

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "org.analog.mappers.guestMappers";
	
	@Override
	public void createGuest(String m_id) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + ".createGuest", m_id);

	}

}
