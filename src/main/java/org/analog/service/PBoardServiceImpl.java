package org.analog.service;

import java.util.List;

import javax.inject.Inject;

import org.analog.domain.PBoardVO;
import org.analog.persistence.PBoardDAO;
import org.springframework.stereotype.Service;

@Service
public class PBoardServiceImpl implements PBoardService {

	@Inject
	private PBoardDAO dao;

	@Override
	public void regist(PBoardVO pboard) throws Exception {
		
		System.out.println("PBoardServiceImpl.regist...........");

		String[] files = pboard.getFiles();
		
		System.out.println("PBoardServiceImpl.regist...........2");

		PBoardVO[] pboards = new PBoardVO[files.length];
		

		System.out.println("PBoardServiceImpl.regist...........3");
		
		for(String imgsrc :files){
			for (PBoardVO tmp : pboards){
				tmp = pboard;
				tmp.setPb_img(imgsrc);
				System.out.println(tmp.toString());
				dao.create(tmp);
				break;
			}
		}
		
		System.out.println("PBoardServiceImpl.regist...........4");
		
	}

	@Override
	public List<String> getPhotoList(Integer pbm_no) {
		
		return dao.selectList(pbm_no);
	}

}
