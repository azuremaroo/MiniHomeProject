package org.analog.persistence;

import javax.inject.Inject;

import org.analog.domain.PBoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PBoardDAOImpl implements PBoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.analog.mappers.pboardMappers";

	@Override
	public void create(PBoardVO vo) throws Exception {
		
		System.out.println("PBoardDAOImpl.create...........");
		
		session.insert(namespace + ".create", vo);

	}

}
