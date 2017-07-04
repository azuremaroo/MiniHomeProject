package org.analog.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	// public static String uploadFile(String uploadPath,
	// String originalName,
	// byte[] fileData)throws Exception{
	//
	// return null;
	// }
	//

	// PPT PART5-2-3 참고
	// 파일 업로드 메소드 : 파일 저장 경로, 업로드 경로, 업로드된 파일 이름 지정, 업로드된 파일 데이터 보관
	// 이미지 파일 데이터를 바이트 데이터 형태로 받아옴
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		// 시작: 파일 업로드 처리
		
		UUID uid = UUID.randomUUID();

		// 파일명 만들기
		String savedName = uid.toString() + "_" + originalName;

		// 업로드된 파일이 저장될 경로
		String savedPath = calcPath(uploadPath);

		// 파일객체 생성할 때 받는 파라미터를 넣어줌 (아직 빈그릇 상태)
		File target = new File(uploadPath + savedPath, savedName);

		// ??? fileData를 target에 복사 = 만들어진 디렉토리에 가져온 바이트 형태의 데이터를 저장 (빈그릇에 실제 데이터를 넣어줌)
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		String uploadedFileName = null;
		
		// 파일 확장자가 이미지 타입인지 검사
		// 이미지파일일 경우
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} 
		// 이미지파일이 아닐 경우
		else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}

		return uploadedFileName;

	}

	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {

		String iconName = uploadPath + path + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 썸네일 만드는 메소드
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// uploadPath : servlet.context 에 넣어둔 기본 경로 ( D:\Spring\workspace\ex04\image )
		// path : 파일이 저장된 경로
		// fileName : 파일 이름
		
		
		// 시작 : 썸네일 이미지 처리

		// 실제 저장된게 아니라 메모리에 임시로 올려둔 이미지
		// Buffer : 완충시키다. 데이터의 임시 저장소
		// BufferedImage : 이미지 데이터를 메모리상에 임시로 저장해두는 저장소
		// ImageIO : 이미지 인풋 아웃풋 객체
		// ImageIO.read : 이미지 데이터를 메모리에 임시로 올리는 메소드
		// Scalr.resize를 이용해 썸네일 크기로 가공하기 위해 원본 데이터를 불러오는 과정
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));

		// Scalr.resize : Scalr 객체를 이용해 리사이즈. 버퍼에 올려둔 이미지를 파라미터로 필요로함
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		// 가공된 썸네일 이미지 파일의 이름 만들기
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

		// 만들어진 이미지 파일의 이름으로 파일 객체(빈그릇) 생성
		File newFile = new File(thumbnailName);
		
		// 파일의 확장자, 파일의 포멧
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		// 실제 파일 저장 (빈그릇에 실제 데이터를 넣어줌)
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		// 썸네일 파일의 이름 중 일부를 / 로 변경
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 업로드 경로 계산하는 메소드
	private static String calcPath(String uploadPath) {

		// 업로드 날짜를 얻기 위해 Calendar 사용
		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}

	// String... : 가변인자. String타입의 변수가 다수개일 수 있다. = 파라미터 개수가 여러개일 수 있다(스트링
	// 타입으로만)
	// 여기서는 연, 월, 일(yearPath,monthPath,datePath)을 받기 위함
	private static void makeDir(String uploadPath, String... paths) {

		// 파일명 중복 체크
		// length-1 = 3-1 = 2
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				// .mkdir() : 디렉토리 만드는 메소드
				dirPath.mkdir();
			}
		}
	}

}
