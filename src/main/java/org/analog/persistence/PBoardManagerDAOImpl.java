package org.analog.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.analog.domain.PBoardManagerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PBoardManagerDAOImpl implements PBoardManagerDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "org.analog.mappers.pboardManagerMappers";

	@Override
	public void createPBorad(String m_id, String pbm_name) {

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("pbm_name", pbm_name);
		paramMap.put("m_id", m_id);

		sqlSession.insert(namespace + ".createPBoard", paramMap);

	}

}
