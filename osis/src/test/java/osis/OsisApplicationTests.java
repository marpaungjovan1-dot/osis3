package com.example.osis;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication // Menandakan bahwa ini adalah aplikasi Spring Boot
public class OsisApplication {

	public static void main(String[] args) {
		// Menjalankan server aplikasi
		SpringApplication.run(OsisApplication.class, args);
	}

}