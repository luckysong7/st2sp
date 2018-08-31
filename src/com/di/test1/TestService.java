package com.di.test1;

public class TestService {
	// 기본적인 값을 읽어오는 클래스
	// Dependency Injection (의존성 주입) 방식 
	
	private Test test;
	
	public TestService() {
		// TODO Auto-generated constructor stub
	}
	
	public TestService(Test test){
		this.test = test;
	}
	
	//객체를 생성해서 대입
	public void setTest(Test test){
		this.test = test;
	}
	
	public String getValue(){
		return test.result();
	}
	
}
