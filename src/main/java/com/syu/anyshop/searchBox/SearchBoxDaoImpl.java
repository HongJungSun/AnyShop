package com.syu.anyshop.searchBox;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchBoxDaoImpl implements SearchBoxDao {
		
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regiSearchBox(SearchBoxInfo searchBox) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchBox", searchBox.getSearchBox());
		map.put("id", searchBox.getId());
		map.put("age", String.valueOf(searchBox.getAge()));
		map.put("gender", searchBox.getGender());	
		
		sqlSession.insert("searchBox.regiSearchBox", map);
		return;
	}

	@Override
	public void regiSearchBox_noSession(SearchBoxInfo searchBox) {
	
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchBox", searchBox.getSearchBox());
		map.put("id", "비로그인");
		map.put("age", "0");
		map.put("gender", "비로그인");	
		
		sqlSession.insert("searchBox.regiSearchBox_noSession", map);
		return;		
		
	}
}
