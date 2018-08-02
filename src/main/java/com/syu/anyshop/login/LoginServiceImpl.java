package com.syu.anyshop.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.syu.anyshop.product.ProductInfo;

@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor= {Exception.class})
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao loginDao;
	
	@Override
	public boolean loginCheck(LoginInfo loginInfo) {		
		return loginDao.loginCheck(loginInfo);
	}

	@Override
	public void addMember(LoginInfo loginInfo) {
		loginDao.addMember(loginInfo);
	}

	@Override
	public LoginInfo viewMember(LoginInfo loginInfo) {
		return loginDao.viewMember(loginInfo);
	}

	@Override
	public void updateMember(LoginInfo loginInfo) {
		loginDao.updateMember(loginInfo);
	}

	@Override
	public void deleteMember(String id) {
		loginDao.deleteMember(id);
	}

	@Override
	public String findId(String name, String phone) {
		return loginDao.findId(name, phone);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		return loginDao.findPw(id, name, phone);
	}

	@Override
	public int userCheck(String id) {
		return loginDao.userCheck(id);
	}

	@Override
	public String pwCheck(String id) {
		return loginDao.pwCheck(id);
	}
	
	@Override
	public void updatePw(String id, String pw) {
		
		loginDao.updatePw(id, pw);
	}

	@Override
	public int checkIdPw(String id, String pw) {
		
		return loginDao.checkIdPw(id, pw);
	}

	@Override
	public List<ProductInfo> mainScreen() {

		return loginDao.mainScreen();
	}

	@Override
	public List<ProductInfo> mainProductAllList(String product_kinds) {
		return loginDao.mainProductAllList(product_kinds);
	}

	@Override
	public LoginInfo sessionUpadte(String id) {
		
		return loginDao.sessionUpadte(id);
	}

	@Override
	public List<String> selectPopularProduct_id() {
		
		return loginDao.selectPopularProduct_id();
	}

	@Override
	public List<ProductInfo> selectPopularProduct(String product_id) {
		
		return loginDao.selectPopularProduct(product_id);
	}

	@Override
	public List<ProductInfo> selectSeasonProduct(String keyword) {
		
		return loginDao.selectSeasonProduct(keyword);
	}


}
