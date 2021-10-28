package com.deco.controller.action;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deco.dao.CafeDao;
import com.deco.dao.EtcDao;
import com.deco.dto.Cafe;
import com.deco.dto.Etc;
import com.deco.dto.SessionDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		int pageNo =  Integer.parseInt(request.getParameter("page"));
		String path="c:\\upload/etc";
		int idx =0;
	      int size=10*1024*1024; 
	     
	      try {
		      MultipartRequest multi_request = new MultipartRequest(request,path,size,"UTF-8",
		                                    new DefaultFileRenamePolicy());
		   	
		      
	    idx=Integer.parseInt(multi_request.getParameter("eidx"));
		String location= multi_request.getParameter("location");
		String name= multi_request.getParameter("name");
		double grade= Double.parseDouble(multi_request.getParameter("grade"));
		String content= multi_request.getParameter("content");
		String menu= multi_request.getParameter("menu");
		String opentime= multi_request.getParameter("opentime");
		String closetime= multi_request.getParameter("closetime");
		String addr= multi_request.getParameter("addr");
		String phone= multi_request.getParameter("phone");
		String outimage = multi_request.getFilesystemName("outimage");		
		String inimage = multi_request.getFilesystemName("inimage");
		
		
		Etc dto = new Etc();
		dto.setEidx(idx);
		dto.setLocation(location);
		dto.setName(name);
		dto.setGrade(grade);
		dto.setContent(content);
		dto.setMenu(menu);
		dto.setOpentime(opentime);
		dto.setClosetime(closetime);
		dto.setAddr(addr);
		dto.setPhone(phone);
		dto.setOutimage(outimage);
		dto.setInimage(inimage);
		
		
		EtcDao dao = EtcDao.getInstance();
		dao.update(dto);
		System.out.println(dto);
	      }catch (Exception e) {
			   e.printStackTrace();
		}
	  System.out.println(idx);
		
		ActionForward foward =new ActionForward();
		foward.isRedirect = true;
		foward.url="etc.deco?eidx="+idx+ "&page="+pageNo;
		return foward;
		
	}


}
