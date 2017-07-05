package org.analog.persistence;

import java.util.List;

import org.analog.domain.PBoardManagerVO;

public interface PBoardManagerDAO {
	
	public void createPBorad(String m_id, String pbm_name);
	public List<PBoardManagerVO> selectPBorad(String m_id);
	public int selectPbm_no(String m_id);

}
