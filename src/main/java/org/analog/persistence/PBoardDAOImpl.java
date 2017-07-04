package org.analog.persistence;

import javax.inject.Inject;

import org.analog.domain.PBoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PBoardDAOImpl implements PBoardDAO {

	private static String namespace = "org.myproject.mappers.pboardMapper";

	@Inject
	private SqlSession session;

	@Override
	public void create(PBoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

}
