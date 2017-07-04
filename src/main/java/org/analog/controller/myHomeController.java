package org.analog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.analog.domain.MemberVO;
import org.analog.service.myPageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("loginMember")
public class myHomeController {

	private static final Logger logger = LoggerFactory.getLogger(myHomeController.class);

	@Inject
	private myPageService service;

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageGET(Model model, HttpSession session) throws Exception {

		logger.info("myPageGET PAGE...............");

		MemberVO vo = (MemberVO)session.getAttribute("loginMember");
		if(vo != null) {
			logger.info("loginGET PAGE..." + vo.toString());
			
			model.addAttribute("m_info", service.readUser(vo.getM_id()));
			model.addAttribute("m_guest", service.readGuest(vo.getM_id()));
			model.addAttribute("m_pboard", service.readPBoard(vo.getM_id()));
			model.addAttribute("m_vboard", service.readVBoard(vo.getM_id()));
			
			
			return "myPage";
		}
		return "login";

	}

	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public void myPagePOST(MemberVO vo, Model model) throws Exception {

		logger.info("myPagePOST PAGE...............");

		logger.info(vo.toString());

	} 
	 

}
