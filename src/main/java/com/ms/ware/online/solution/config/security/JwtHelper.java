package com.ms.ware.online.solution.config.security;

import com.ms.ware.online.solution.config.exceptiion.UnauthorizedException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

@Service
public class JwtHelper {
    private final String privateKey = "vpqoCz12Tx";

    public String create(String id, String username, String usertype, String branch) {
        String token = "";
        try {
            Date date = new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(date);
            c.add(Calendar.DATE, 1);
            token = Jwts.builder().
                    setId(id)
                    .setIssuer(username)
                    .setAudience(usertype)
                    .setSubject(branch)
                    .setIssuedAt(date)
                    .setExpiration(c.getTime())
                    .signWith(SignatureAlgorithm.HS256, privateKey).compact();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return token;
    }

    public AuthenticatedUser decodeToken(String authToken) {
        Claims claims = Jwts.parser().setSigningKey(privateKey).parseClaimsJws(authToken.substring(7)).getBody();
        if (claims == null) {
            throw new UnauthorizedException();
        }
        return AuthenticatedUser.builder().id(claims.getId()).usertype(claims.getAudience()).username(claims.getIssuer()).branch(claims.getSubject()).build();
    }
}