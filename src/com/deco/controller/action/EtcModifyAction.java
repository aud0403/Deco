package com.deco.controller.action;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deco.dao.EtcDao;
import com.deco.dto.Etc;
import com.deco.dto.SessionDto;

public class EtcModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		SessionDto sdto = (SessionDto)session.getAttribute("user");
		if(sdto==null) {
			request.setAttribute("message", "세션이 만료되었습니다. 로그인 화면으로 이동합니다.");
			request.setAttribute("url", "home_login.deco");
			forward.isRedirect = false;
			forward.url="error/alert.jsp";
			return forward;
		}
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		int eidx=Integer.parseInt(request.getParameter("eidx"));
		String location= request.getParameter("location");
		String name= request.getParameter("name");
		double grade= Double.parseDouble(request.getParameter("grade"));
		String content= request.getParameter("content");
		String menu= request.getParameter("menu");
		String opentime= request.getParameter("opentime");
		String closetime= request.getParameter("closetime");
		String addr= request.getParameter("addr");
		String phone= request.getParameter("phone");
		
		Etc dto = new Etc();
		dto.setEidx(eidx);
		dto.setLocation(location);
		dto.setName(name);
		dto.setGrade(grade);
		dto.setContent(content);
		dto.setMenu(menu);
		dto.setOpentime(opentime);
		dto.setClosetime(closetime);
		dto.setAddr(addr);
		dto.setPhone(phone);
		
		EtcDao dao = EtcDao.getInstance();
		dao.update(dto);
		
		forward.isRedirect = false;
		forward.url="etc.deco?eidx="+eidx;
		return forward;
		
	}

}
