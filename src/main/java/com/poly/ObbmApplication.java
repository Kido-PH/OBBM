package com.poly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class ObbmApplication {

	public static void main(String[] args) {
		SpringApplication.run(ObbmApplication.class, args);
	}

}
