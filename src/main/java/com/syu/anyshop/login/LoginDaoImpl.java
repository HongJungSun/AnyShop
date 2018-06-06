package com.syu.anyshop.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.syu.anyshop.product.ProductInfo;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(LoginInfo loginInfo) {
		int count = Integer.parseInt(sqlSession.selectOne("login.loginCheck", loginInfo).toString()),
				totalCount = sqlSession.selectOne("login.totalAccount");
		if(totalCount>0) {
			if(count>0) {
				return true;
			}else {
				return false;
			}
		}
		return false;
	}

	@Override
	public void addMember(LoginInfo loginInfo) {
		sqlSession.insert("login.addMember", loginInfo);
	}

	@Override
	public LoginInfo viewMember(LoginInfo loginInfo) {
		return sqlSession.selectOne("login.viewMember", loginInfo);
	}

	@Override
	public void updateMember(LoginInfo loginInfo) {
		sqlSession.update("login.updateMember", loginInfo);
	}

	@Override
	public void deleteMember(String id) {
		sqlSession.delete("login.deleteMember", id);
	}

	@Override
	public String findId(String name,String phone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("phone", phone);
		
		return sqlSession.selectOne("login.findId", map);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("phone", phone);
		
		return sqlSession.selectOne("login.findPw", map);
	}

	@Override
	public void updatePw(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		sqlSession.update("login.updatePw", map);
	}
	
	@Override
	public int userCheck(String id) {
		return sqlSession.selectOne("login.userCheck", id);
	}

	@Override
	public String pwCheck(String id) {
		return sqlSession.selectOne("login.pwCheck", id);
	}

	@Override
	public int checkIdPw(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);

		return sqlSession.selectOne("login.checkIdPw", map);
	}

	@Override
	public List<ProductInfo> mainScreen() {

		return sqlSession.selectList("login.mainScreen");
	}

	@Override
	public List<ProductInfo> mainProductAllList(String product_kinds) {		

		return sqlSession.selectList("login.mainProductAllList", product_kinds);
	}

	@Override
	public LoginInfo sessionUpadte(String id) {
		
		return sqlSession.selectOne("login.sessionUpadte", id);
	}

	@Override
	public List<String> selectPopularProduct_id() {
	
		return sqlSession.selectList("login.selectPopularProduct_id");
	}

	@Override
	public List<ProductInfo> selectPopularProduct(String product_id) {
		
		return sqlSession.selectList("login.selectPopularProduct", product_id);
	}

	@Override
	public List<ProductInfo> selectSeasonProduct(String keyword) {
		
		return sqlSession.selectList("login.selectSeasonProduct", keyword);
	}
	
}
