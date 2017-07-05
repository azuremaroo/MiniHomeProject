package org.analog.persistence;

import java.util.List;

import org.analog.domain.PBoardVO;

public interface PBoardDAO {
	
	public void create(PBoardVO vo) throws Exception;

	public List<String> selectList(Integer pbm_no);


}
