package com.yupanastudio.igest.server;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    private static final Logger logger = LoggerFactory.getLogger(JwtRequestFilter.class);
    private static final String BEARER_PREFIX = "Bearer ";
    private static final String AUTH_HEADER = "Authorization";

    private final UserDetailsService userDetailsService;
    private final JwtUtilService jwtUtilService;

    public JwtRequestFilter(UserDetailsService userDetailsService, JwtUtilService jwtUtilService) {
        this.userDetailsService = userDetailsService;
        this.jwtUtilService = jwtUtilService;
    }

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain chain) throws ServletException, IOException {

        if (SecurityContextHolder.getContext().getAuthentication() != null) {
            chain.doFilter(request, response);
            return;
        }

        final String jwt = extractJwtFromRequest(request);
        if (jwt == null) {
            chain.doFilter(request, response);
            return;
        }

        try {
            authenticateUser(jwt, request);
        } catch (IllegalArgumentException e) {
            logger.warn("Invalid JWT token: {}", e.getMessage());
        }

        chain.doFilter(request, response);
    }

    private String extractJwtFromRequest(HttpServletRequest request) {
        final String authHeader = request.getHeader(AUTH_HEADER);
        if (StringUtils.hasText(authHeader) && authHeader.startsWith(BEARER_PREFIX)) {
            return authHeader.substring(BEARER_PREFIX.length());
        }
        return null;
    }

    private void authenticateUser(String jwt, HttpServletRequest request) {
        final String username = jwtUtilService.extractUsername(jwt);
        if (!StringUtils.hasText(username)) {
            return;
        }

        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        if (!jwtUtilService.validateToken(jwt, userDetails)) {
            return;
        }

        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                userDetails, null, userDetails.getAuthorities());
        authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authToken);
    }

}
