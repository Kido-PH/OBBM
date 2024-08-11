package com.poly.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.Service.DateFormatter;

@Configuration
public class DateConfig implements WebMvcConfigurer {

	@Override
    public void addFormatters(FormatterRegistry registry) { 
        registry.addFormatter(new DateFormatter());
    }}
