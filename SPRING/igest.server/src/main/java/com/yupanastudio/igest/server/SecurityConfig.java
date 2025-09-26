package com.yupanastudio.igest.server;

import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class SecurityConfig {

    private final UserDetailsService userDetailsService;
    private final JwtRequestFilter jwtRequestFilter;

    public SecurityConfig(UserDetailsService userDetailsService, JwtRequestFilter jwtRequestFilter) {
        this.userDetailsService = userDetailsService;
        this.jwtRequestFilter = jwtRequestFilter;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(csrf -> csrf.disable())
                .cors(Customizer.withDefaults())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/auth/**").permitAll()
                        .requestMatchers("/test/token").authenticated()
                        .anyRequest().access(this::authorizeRequest)
                )
                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    private AuthorizationDecision authorizeRequest(java.util.function.Supplier<Authentication> authSupplier, org.springframework.security.web.access.intercept.RequestAuthorizationContext authContext) {
        HttpServletRequest request = authContext.getRequest();
        Authentication authentication = authSupplier.get();

        if (authentication == null || !authentication.isAuthenticated()) {
            return new AuthorizationDecision(false);
        }

        String requestPath = request.getServletPath();
        String method = request.getMethod();
        String requestWithMethod = requestPath + ":" + method;

        boolean hasPermission = authentication.getAuthorities().stream()
                .map(authority -> authority.getAuthority())
                .filter(this::isValidPermissionPattern)
                .anyMatch(authority -> matchesPermission(authority, requestWithMethod));

        return new AuthorizationDecision(hasPermission);
    }

    private boolean isValidPermissionPattern(String authority) {
        return authority != null
                && !authority.contains("..")
                && !authority.contains("//")
                && authority.length() <= 200;
    }

    private boolean matchesPermission(String authority, String requestWithMethod) {
        String pattern = authority
                .replace("/**", "/.*")
                .replace(":", "\\:");
        return requestWithMethod.matches("^" + pattern + "$");
    }

    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        config.setAllowedOriginPatterns(List.of(
                "http://localhost:4200",
                "https://app.sanjuanbosco.edu.pe",
                "https://sanfernando.edu.pe",
                "https://sanjuanbosco.edu.pe",
                "https://app.sanfernando.edu.pe"
        ));
        config.setAllowedHeaders(List.of("Authorization", "Content-Type", "X-Requested-With"));
        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        config.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }

    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http) throws Exception {
        AuthenticationManagerBuilder authenticationManagerBuilder = http.getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
        return authenticationManagerBuilder.build();
    }

}
