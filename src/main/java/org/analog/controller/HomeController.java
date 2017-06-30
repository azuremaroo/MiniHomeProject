package org.analog.controller;

import javax.inject.Inject;

import org.analog.domain.MemberVO;
import org.analog.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginGET(Model model) {

		logger.info("loginGET PAGE...............");

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
//	@RequestMapping(value = "/main", method = RequestMethod.POST)
//	public String mainPOST(@ModelAttribute MemberVO loginMember) throws Exception {
//
//		logger.info("mainPOST PAGE...............");
//		logger.info(loginMember.toString());
//
//		// model.addAttribute("m_intro", service.viewIntro(m_id));
//
//		return "main";
//	}


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
	 

}
