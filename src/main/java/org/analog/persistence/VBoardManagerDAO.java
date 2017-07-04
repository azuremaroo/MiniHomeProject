package org.analog.persistence;

import java.util.List;

import org.analog.domain.VBoardManagerVO;

public interface VBoardManagerDAO {

	public void createVBorad(String m_id, String vbm_name);
	public List<VBoardManagerVO> selectVBorad(String m_id);
	
}
