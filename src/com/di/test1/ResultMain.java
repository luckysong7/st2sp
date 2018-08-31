package com.di.test1;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ResultMain {

	public static void main(String[] args) {

		String path = "com/di/test1/applicationContext.xml";
		Resource res = new ClassPathResource(path);
		
		// �������� �����̳ʸ� ����
		BeanFactory factory = new XmlBeanFactory(res);
		
		// ������ �����̳ʿ��� �� ��ü�� ������
		TestService ob = (TestService)factory.getBean("testService");
		
		System.out.println(ob.getValue());
		
		
	}
}
