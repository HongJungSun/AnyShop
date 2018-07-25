package com.syu.anyshop.searchBox;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor= {Exception.class})
public class SearchBoxServiceImpl implements SearchBoxService {
	
	@Autowired
	private SearchBoxDao searchBoxDao;

	@Override
	public void regiSearchBox(SearchBoxInfo searchBox) {
		
		searchBoxDao.regiSearchBox(searchBox);

	}

	@Override
	public void regiSearchBox_noSession(SearchBoxInfo searchBox) {
		
		searchBoxDao.regiSearchBox_noSession(searchBox);

		
	}

}
