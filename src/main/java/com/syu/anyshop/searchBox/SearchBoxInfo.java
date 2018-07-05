package com.syu.anyshop.searchBox;

public class SearchBoxInfo {
	
	private String id;
	private int age;
	private String gender;
	private String searchBox;
	
	public SearchBoxInfo() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSearchBox() {
		return searchBox;
	}

	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}

	@Override
	public String toString() {
		return "searchBoxInfo [id=" + id + ", age=" + age + ", gender=" + gender + ", searchBox=" + searchBox + "]";
	}
	
	

}
