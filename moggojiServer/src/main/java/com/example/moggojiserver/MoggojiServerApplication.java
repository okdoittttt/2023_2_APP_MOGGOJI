package com.example.moggojiserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@CrossOrigin
public class MoggojiServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(MoggojiServerApplication.class, args);
    }

}
