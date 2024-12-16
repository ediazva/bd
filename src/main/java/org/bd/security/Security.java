package org.bd.security;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

public class Security {
    static public Cookie getCookieUsuario(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
//        Cookie usuarioCookie = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("usuario")) {
                return cookie;
            }
//                request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        return null;
    }
}
