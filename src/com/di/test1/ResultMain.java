package com.di.test1;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ResultMain {

	public static void main(String[] args) {

		String path = "com/di/test1/applicationContext.xml";
		Resource res = new ClassPathResource(path);
		
		// 스프링의 컨테이너를 생성
		BeanFactory factory = new XmlBeanFactory(res);
		
		// 스프링 컨테이너에서 빈 객체를 가져옴
		TestService ob = (TestService)factory.getBean("testService");
		
		System.out.println(ob.getValue());
		
		
	}
}
