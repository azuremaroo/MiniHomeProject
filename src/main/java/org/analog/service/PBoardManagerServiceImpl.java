package org.analog.service;

import javax.inject.Inject;

import org.analog.persistence.PBoardManagerDAO;
import org.springframework.stereotype.Service;

@Service
public class PBoardManagerServiceImpl implements PBoardManagerService {
	
	@Inject
	private PBoardManagerDAO dao;

	@Override
	public int getPbm_no(String m_id) {
		return dao.selectPbm_no(m_id);
	}

}
