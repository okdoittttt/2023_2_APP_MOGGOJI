package com.example.moggojiserver.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserJoinRequest {

    private long number;
    private String id;
    private String pwd;
    private String email;
    private String name;
    private String gender;
    protected int age;

}
