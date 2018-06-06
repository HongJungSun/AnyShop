package com.syu.anyshop.searchBox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchBoxServiceImpl implements SearchBoxService {
	
	@Autowired
	private SearchBoxDao searchBoxDao;

	@Override
	public void regiSearchBox(String searchBox, String id, int age, String gender) {
		
		searchBoxDao.regiSearchBox(searchBox, id, age, gender);
		return;
	}

}
