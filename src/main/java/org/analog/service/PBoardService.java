package org.analog.service;

import java.util.List;

import org.analog.domain.PBoardVO;

public interface PBoardService {
	
	public void regist(PBoardVO board) throws Exception;

	public List<String> getPhotoList(Integer pbm_no);

}
