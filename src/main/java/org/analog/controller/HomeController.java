package org.analog.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.analog.domain.MemberVO;
import org.analog.domain.PBoardVO;
import org.analog.service.MemberService;
import org.analog.service.PBoardManagerService;
import org.analog.service.PBoardService;
import org.analog.util.MediaUtils;
import org.analog.util.UploadFileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("loginMember")
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private MemberService service;
	
	@Inject
	private PBoardManagerService pbm_service;

	@Inject
	private PBoardService pb_service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginGET(Model model, HttpSession session) {

		logger.info("loginGET PAGE...............");

		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
		if (vo != null) {
			logger.info("loginGET PAGE..." + vo.toString());
			return "main";
		}
		return "login";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String loginPOST(@RequestParam("m_id") String id, @RequestParam("m_pw") String pw, RedirectAttributes rttr)
			throws Exception {

		logger.info("loginPOST post ...........");

		int result = -1;
		result = service.isMember(id, pw);

		if (result == 0) {
			logger.info("비밀번호 불일치");
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/login";
		} else if (result == -1) {
			logger.info("아이디 불일치");
			rttr.addFlashAttribute("msg", "아이디가 존재하지 않습니다.");
			return "redirect:/login";
		}

		// 로그인 성공
		MemberVO loginMember = service.readUser(id);

		logger.info("로그인 성공");
		logger.info(loginMember.toString());

		rttr.addFlashAttribute("loginMember", loginMember);
		return "redirect:/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET2(Model model) {

		logger.info("loginGET2 PAGE...............");

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST2(@RequestParam("m_id") String id, @RequestParam("m_pw") String pw, RedirectAttributes rttr)
			throws Exception {

		logger.info("loginPOST2 post ...........");

		int result = -1;
		result = service.isMember(id, pw);

		if (result == 0) {
			logger.info("비밀번호 불일치");
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:/login";
		} else if (result == -1) {
			logger.info("아이디 불일치");
			rttr.addFlashAttribute("msg", "아이디가 존재하지 않습니다.");
			return "redirect:/login";
		}

		// 로그인 성공
		MemberVO loginMember = service.readUser(id);

		logger.info("로그인 성공");
		logger.info(loginMember.toString());

		rttr.addFlashAttribute("loginMember", loginMember);
		return "redirect:/main";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutMemberGET(@ModelAttribute MemberVO loginMember, SessionStatus sessionStatus) throws Exception {

		logger.info("logoutMemberGET get ...........");

		sessionStatus.setComplete(); // 세션정보 제거
		return "redirect:/";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(Model model) {

		logger.info("joinGET PAGE...............");

	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO vo) throws Exception {

		logger.info("joinPOST PAGE...............");

		logger.info(vo.toString());

		service.insertMember(vo);

		return "redirect:/joinSuccess";
	}

	@RequestMapping(value = "/joinSuccess", method = RequestMethod.GET)
	public void joinSuccessGET(Model model) {

		logger.info("joinSuccess PAGE...............");

	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainGET(@ModelAttribute MemberVO loginMember) throws Exception {

		logger.info("mainGET PAGE...............");
		logger.info(loginMember.toString());

		// model.addAttribute("m_intro", service.viewIntro(m_id));

		return "main";
	}
	//
	// @RequestMapping(value = "/main", method = RequestMethod.POST)
	// public String mainPOST(@ModelAttribute MemberVO loginMember) throws
	// Exception {
	//
	// logger.info("mainPOST PAGE...............");
	// logger.info(loginMember.toString());
	//
	// // model.addAttribute("m_intro", service.viewIntro(m_id));
	//
	// return "main";
	// }

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public void mainPOST(MemberVO vo, Model model) throws Exception {

		logger.info("mainPOST PAGE...............");

		logger.info(vo.toString());

		service.updateIntro(vo);

		// 다시 조회
		MemberVO loginMember = service.readUser(vo.getM_id());

		logger.info(loginMember.toString());

		model.addAttribute("loginMember", loginMember);

	}

	@RequestMapping(value = "/p_board", method = RequestMethod.GET)
	public String p_BoardGET(Model model, PBoardVO pboard, HttpSession session) throws Exception {

		logger.info("p_BoardGET PAGE...............");

		MemberVO vo = (MemberVO) session.getAttribute("loginMember");
	
		model.addAttribute("pbm_no", pbm_service.getPbm_no(vo.getM_id()));

		return "p_board";
	}

	@RequestMapping("/p_board/{pbm_no}")
	@ResponseBody
	public List<String> getPhotoList(@PathVariable("pbm_no") Integer pbm_no) throws Exception {

		logger.info("getPhotoList PAGE...............");

		return pb_service.getPhotoList(pbm_no);
	}

	@RequestMapping(value = "/p_board", method = RequestMethod.POST)
	public String p_BoardPOST(PBoardVO pboard, RedirectAttributes rttr, HttpSession session) throws Exception {

		logger.info("p_BoardPOST PAGE ...........");
		logger.info(pboard.toString());
		
		MemberVO vo = (MemberVO) session.getAttribute("loginMember");

		pboard.setPbm_no(pbm_service.getPbm_no(vo.getM_id()));
		pboard.setPb_content("내용");
		pboard.setPb_title("제목");

		logger.info(pboard.toString());

		pb_service.regist(pboard);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/p_board";
	}

	@RequestMapping(value = "/p_board/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
	}

	@ResponseBody
	@RequestMapping(value = "/p_board/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		logger.info("uploadAjax POST...............");

		logger.info("originalName: " + file.getOriginalFilename());

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	// 썸네일 이미지를 뿌려주는 메소드
	@ResponseBody
	@RequestMapping("/p_board/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		logger.info("displayFile.................... ");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("FILE NAME: " + fileName);

		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {

				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	  @RequestMapping(value ="/join/checkId/{m_id}", method=RequestMethod.GET)
	  public ResponseEntity<String> checkIdAjax(@PathVariable("m_id") String m_id)throws Exception{
		  
		  logger.info("checkIdAjax GET...............");
		  logger.info("checkIdAjax GET..m_id>>......"+m_id);
	    
		  ResponseEntity<String> entity = null;
		    try {
		      int checkCnt = service.checkId(m_id);
		      if(checkCnt == 1)
		    	  entity = new ResponseEntity<String>("NO", HttpStatus.OK);
		      else
		    	  entity = new ResponseEntity<String>("YES", HttpStatus.OK);
		    } catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		    }
		    return entity;
	  }

}
