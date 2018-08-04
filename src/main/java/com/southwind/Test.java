package com.southwind;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.southwind.repository.AuthorityRepository;


public class Test {
	private static AuthorityRepository articleRepository;
	static {
		articleRepository = (AuthorityRepository) new ClassPathXmlApplicationContext("classpath:spring.xml").getBean("authorityRepository");
	}
	public static void main(String[] args) {
//		findAll();
//		System.out.println("----------------");
//		deletAll();
//		findAll();
//		findBySort();
		System.out.println(articleRepository);
	}
}
