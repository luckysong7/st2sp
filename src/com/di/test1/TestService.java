package com.di.test1;

public class TestService {
	// �⺻���� ���� �о���� Ŭ����
	// Dependency Injection (������ ����) ��� 
	
	private Test test;
	
	public TestService() {
		// TODO Auto-generated constructor stub
	}
	
	public TestService(Test test){
		this.test = test;
	}
	
	//��ü�� �����ؼ� ����
	public void setTest(Test test){
		this.test = test;
	}
	
	public String getValue(){
		return test.result();
	}
	
}
