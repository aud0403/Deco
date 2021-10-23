package com.deco.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.deco.dto.Cafe;
import com.deco.dto.Dibs;
import com.deco.mybatis.SqlSessionBean;

public class DibsDao {
	private static DibsDao dao = new DibsDao();
	private DibsDao() {}
	public static DibsDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	public Dibs getDibs(String nickname) {
		SqlSession mapper = factory.openSession();
		Dibs dibs = mapper.selectOne("getDibs", nickname);
		mapper.close();
		return dibs;
	}
	
	// idx 토크나이저로 쪼갠다음 하나씩 해당 idx의 cafe정보 가져오는 메소드
	public Cafe getCafeDibs(String idx) {
		int idxCafe = Integer.parseInt(idx);
		SqlSession mapper = factory.openSession();
		Cafe cafe = mapper.selectOne("getCafeDibs", idxCafe);
		mapper.close();
		return cafe;
	}
	
	public void updateCafeDibs(Map<String,String> map) {
		SqlSession mapper = factory.openSession();
		mapper.update("updateCafeDibs", map);
		mapper.commit();
		mapper.close();
	}
	
	
	
	
}
