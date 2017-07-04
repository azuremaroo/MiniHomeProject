package org.analog.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.analog.domain.VBoardManagerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class VBoardManagerDAOImpl implements VBoardManagerDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "org.analog.mappers.vboardManagerMappers";
	
	@Override
	public void createVBorad(String m_id, String vbm_name) {
		// TODO Auto-generated method stub
		

		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("vbm_name", vbm_name);
		paramMap.put("m_id", m_id);

		sqlSession.insert(namespace + ".createVBoard", paramMap);

	}

	@Override
	public List<VBoardManagerVO> selectVBorad(String m_id) {
		
		return sqlSession.selectList(namespace + ".selectVBoard", m_id);
		
	}

}
