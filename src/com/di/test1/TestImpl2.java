package com.di.test1;

public class TestImpl2 implements Test{
	
	private String name;
	private int age;
	
	public TestImpl2() {
		this.name = "�����";
		this.age = 25;
		
	}
	
	public TestImpl2(String name , int age){
		this.name = name;
		this.age = age;
		
	}

	@Override
	public String result() {
		String str = "�̸� : " + name +	" ���� : " + age;
		return str;
	}
	

}
