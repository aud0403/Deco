package com.deco.controller.action;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deco.dao.FoodDao;
import com.deco.dto.Food;
import com.deco.dto.PageDto;
import com.deco.dto.SessionDto;

public class FoodListAction implements Action {

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
		
		  //           변경 시작위치 
		FoodDao dao = FoodDao.getInstance();
		List<Food> list = new ArrayList<Food>();
		Map<String,Object> map = new HashMap<>();

		int pageNo;
		if(request.getParameter("page")==null) pageNo=1;
		else pageNo = Integer.parseInt(request.getParameter("page"));
		int pageSize =10;
		
		PageDto pageDto = new PageDto(pageNo,dao.getCount(),pageSize);
		
		map.put("pageSize",pageSize);
		map.put("startNo",pageDto.getStartNo());
		
		String locationAll = request.getParameter("locatoinAll");	//전체선택
		String[] location = request.getParameterValues("location");	//지역별 카테고리 배열로 받음
		
		if(locationAll==null&&location==null) {	//처음 리스트 진입 시 
			locationAll = "all";
		}else if(locationAll==null&&location!=null) {	// 전체선택 아닐때 null 방지
			locationAll = "";
		}
			
		if(locationAll.equals("all")) { // 전체선택일경우 & 처음엔 무조건 전체출력
			list = dao.getList(map);
		}else {									// 지역별
			System.out.println(location);
			map.put("location", location);
			list = dao.getLocation(map);
		}
		
		request.setAttribute("pageDto", pageDto);
		request.setAttribute("foodList", list);
		forward.isRedirect = false;
		forward.url="deco/foodList.jsp";
		return forward;
	}

}
