package com.example.moggojiserver.User;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;

@Entity
public class UserItem {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long number;

    @NotNull(message = "ID is required")
    private String id;

    @NotNull(message = "pwd is required")
    private String pwd;

    @NotNull(message = "email is required")
    private String email;

    public UserItem() {
    }

    public UserItem(long number) { this.number = number; }

    public boolean checkPassword(String input_pwd) {
        boolean checkPwd = pwd == input_pwd;

        return checkPwd;
    }
//    =============================================================================================

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}