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
	public void regiSearchBox(String searchBox, String id, int age, String gender) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchBox", searchBox);
		map.put("id", id);
		map.put("age", String.valueOf(age));
		map.put("gender", gender);	
		
		sqlSession.insert("searchBox.regiSearchBox", map);
		return;
	}
}
