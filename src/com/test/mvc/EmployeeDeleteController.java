/*===============================
   #23. EmployeeDeleteController.java
   - 사용자 정의 컨트롤러 클래스
   - 직원 데이터 삭제 액션 수행 및
     해당 액션 수행 이후 『emplyoeelist.』
 ================================*/


package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//   사용자 정의 컨트롤러 클래스를 구성한다.
public class EmployeeDeleteController implements Controller
{
	
	private IEmployeeDAO dao;
	
	
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		
		//세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가)-----------------------------
		HttpSession session = request.getSession();
		
		if(session.getAttribute("name")== null)
		{
			//로그인이 되어있지 않은 상황에서의 처리
			mav.setViewName("redirect:loginform.action");
			return mav;
			
		}
		else if(session.getAttribute("admin")== null)
		{
			//로그인은 되었지만 관리자가 아닌 상황 즉, 일반 사원일 때의 처리
			//-- 일반 사원으로 로그인되어있는 상황을 해제하고
			//   다시 관리자로 로그인 할 수 있도록 처리
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		//------------------------------------세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가)
		
		
		//데이터 수신(EmployeeList.jsp 페이지로부터.. employeeId 수신)
		String employeeId = request.getParameter("employeeId");
		
		try
		{
			dao.remove(employeeId);
			
			mav.setViewName("redirect:employeelist.action");
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
}
