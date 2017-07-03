package org.analog.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	
	private static Map<String, MediaType> mediaMap;
	
	static{
		
		mediaMap = new HashMap<String, MediaType>();		
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	// 스프링이 지원하는 MediaType 메소드 
	public static MediaType getMediaType(String type){
		
		// 대문자로 변환해서 파일 포맷을 리턴
		return mediaMap.get(type.toUpperCase());
	}
}



