package com.deco.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deco.controller.action.Action;
import com.deco.controller.action.ActionForward;
import com.deco.controller.action.CafeAction;
import com.deco.controller.action.CafeInsertAction;
import com.deco.controller.action.CafeUpdateAction;
import com.deco.controller.action.DibsListAction;
import com.deco.controller.action.DibsUpdateAction;
import com.deco.controller.action.HomeLoginAction;
import com.deco.controller.action.CafeListAction;
import com.deco.controller.action.LoginAction;
import com.deco.controller.action.LogoutAction;
import com.deco.controller.action.JoinAction;
import com.deco.controller.action.CafeModifyAction;
import com.deco.controller.action.ReviewInsertAction;
import com.deco.controller.action.ReviewListAction;
import com.deco.controller.action.UserInfoAction;
import com.deco.controller.action.UserInfoDeleteAction;
import com.deco.controller.action.UserInfoModifyAction;
import com.deco.controller.action.UserInfoUpdateAction;

@WebServlet("*.deco")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = null;
//		ActionForward forward = new ActionForward();
		
		String spath = request.getServletPath();
		System.out.println(spath);
//		forward.setRedirect(false);
//		forward.setUrl("./");
		String url="./";
		
		if(spath.equals("/home_login.deco")) {			//메인
			Action action = new HomeLoginAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/home.deco")) {		// 로그인 후 홈
			forward = new ActionForward(false, "home.jsp");
		}else if(spath.equals("/login.deco")) {
			Action action = new LoginAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/logout.deco")) {
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/join.deco")) {		// 회원가입
			forward = new ActionForward(false, "deco/join.jsp");
		}else if(spath.equals("/mypage.deco")) {
			forward = new ActionForward(false, "deco/mypage.jsp");
		}else if(spath.equals("/userInfo.deco")) {	// 회원 정보 받아서 userInfo.jsp
			Action action = new UserInfoAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/userInfoUpdate.deco")) {	// 회원 정보 받아서 userInfoUpdate.jsp
			Action action = new UserInfoUpdateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/userInfoModify.deco")) {	// 회원 정보 수정 후 userInfo.jsp
			Action action = new UserInfoModifyAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cafeList.deco")) {		// 카페 목록 검색
			Action action = new CafeListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cafe.deco")) {
			Action action = new CafeAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/joinAction.deco")) {	// 회원가입 완료 후 home_login.deco 로
			Action action = new JoinAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/userInfoDelete.deco")) {	// 회원 탈퇴
			Action action = new UserInfoDeleteAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/dibsList.deco")) {		// mypage에서 찜목록
			Action action = new DibsListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cafeUpdate.deco")) {	// 카페 정보 수정 -> cafeUpdate.jsp로
			Action action = new CafeUpdateAction();
			forward = action.execute(request, response);
		}else if(spath.contentEquals("/cafeModify.deco")){	//카페 정보 수정하고 다시 cafe.jsp로
			Action action = new CafeModifyAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cafeInsert.deco")) {	// 카페 업체 등록 -> cafe.jsp로
			forward = new ActionForward(false,"deco/cafeInsert.jsp");
		}else if(spath.equals("/cafeInsertAction.deco")) {	// 카페 업ㅈ체 등록 완료 후 -> home.deco
			Action action = new CafeInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/reviewList.deco")) {	// 리뷰목록
			Action action = new ReviewListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/reviewInsert.deco")) {	// 리뷰작성(추가) 하고 -> cafe.jsp로
			Action action = new ReviewInsertAction();	// 여기서 카테고리 달라도 if문으로 리뷰 작성되게 구연할것!!
			forward = action.execute(request, response);
		}else if(spath.equals("/dibsUpdate.deco")) {	// 찜목록 추가/삭제
			Action action = new DibsUpdateAction();
			forward = action.execute(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		// 이 시점에서 forward 에 isREdirct 와 url 값이 저장되어있으면 OK!
				if(!forward.isRedirect()) {
					RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
					rd.forward(request, response);
				}else {
					response.sendRedirect(forward.getUrl());
				} 
		
		}
}
