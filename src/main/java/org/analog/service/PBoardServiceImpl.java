package org.analog.service;

import javax.inject.Inject;

import org.analog.domain.PBoardVO;
import org.analog.persistence.PBoardDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PBoardServiceImpl implements PBoardService {

	@Inject
	private PBoardDAO dao;

	@Transactional
	@Override
	public void regist(PBoardVO pboard) throws Exception {

		String[] files = pboard.getFiles();

		PBoardVO[] pboards = new PBoardVO[files.length];

		if (files != null) {
			for (PBoardVO tmp : pboards)
				dao.create(tmp);
		}
	}

}
