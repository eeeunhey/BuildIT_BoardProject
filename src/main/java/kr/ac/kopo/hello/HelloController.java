package kr.ac.kopo.hello;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	public HelloController() {
		System.out.println("HelloController 객체 생성");
		// 스프링에서 제공하는 어노테이션으로 자동 객체 생성
	}
	
	@RequestMapping("/hello/hello.do")
	public ModelAndView hello() {
		
		ModelAndView mav = new ModelAndView("hello/hello");
		mav.addObject("msg", "Hi 스프링 반가워 제발 나와라");
		mav.addObject("name", "내이름은 은혜야~~");
		mav.addObject("today", LocalDate.now());
		
		return mav;	
	}
}
