package com.example.moggojiserver.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class UserLoginRequest {

    private long number;
    private String id;
    private String pwd;
    private String email;
    private String name;
    private String gender;
    protected int age;

    private int imageNumber;

}
