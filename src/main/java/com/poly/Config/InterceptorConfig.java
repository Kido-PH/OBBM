package com.poly.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.Service.AuthInterceptor;



@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthInterceptor auth;
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
			.addPathPatterns("/account/**", "/admin/**","**/menu/**")
			.excludePathPatterns("/assets/**");
	}
	
	
}
