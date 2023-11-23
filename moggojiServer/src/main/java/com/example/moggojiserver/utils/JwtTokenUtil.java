package com.example.moggojiserver.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

public class JwtTokenUtil {
    public static String createToken(long number, String id, String email,
                                     String name, String gender, int age, long imageNumber,
                                     String key, long expireTimeMs) {
        Claims claims = Jwts.claims(); // map
        claims.put("number", number);
        claims.put("id", id);
        claims.put("email", email);
        claims.put("name", name);
        claims.put("gender", gender);
        claims.put("age", age);
        claims.put("imageNumber", imageNumber);

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expireTimeMs))
                .signWith(SignatureAlgorithm.HS256, key)
                .compact();
    }
}
