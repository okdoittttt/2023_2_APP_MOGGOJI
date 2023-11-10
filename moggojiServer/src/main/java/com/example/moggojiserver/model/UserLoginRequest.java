package com.example.moggojiserver.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserLoginRequest {

    private long number;
    private String id;
    private String pwd;
    private String email;
}
