/*
 * Document   : SecurityConfig
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server;

import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .csrf(csrf -> csrf.disable())
                .cors(Customizer.withDefaults())
                .httpBasic(Customizer.withDefaults())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                .requestMatchers("/auth/**").permitAll()
                .requestMatchers("/test/token").authenticated() // Ruta de prueba accesible solo con token válido
                .anyRequest().access((authenticationObject, context) -> {
                    HttpServletRequest request = context.getRequest();
                    //String requestPath = request.getRequestURI();
                    String requestPath = request.getServletPath();
                    String method = request.getMethod();

//                    System.out.println("request.getServletPath() => " + request.getServletPath());
//                    System.out.println("request.getRequestURI() => " + request.getRequestURI());
//                    String requiredPermission = requestPath + ":" + method;
                    Authentication authentication = authenticationObject.get(); // Obtener autenticación

                    // Si no hay autenticación o no está autenticado, denegar acceso
                    if (authentication == null || !authentication.isAuthenticated()) {
                        return new AuthorizationDecision(false);
                    }

                    boolean hasPermission = authentication.getAuthorities().stream()
                            .anyMatch(authRole -> {
                                String pattern = authRole.getAuthority()
                                        .replace("/**", ".*") // Convertir wildcard en regex válido
                                        .replace(":", "\\:"); // Escapar el separador
                                return requestPath.concat(":").concat(method).matches(pattern);
                            });

                    return new AuthorizationDecision(hasPermission);
                })
                )
                .addFilterAfter(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        // SOLO PARA DESARROLLO - NO USAR EN PRODUCCIÓN
        config.setAllowCredentials(false);
        config.setAllowedOriginPatterns(List.of("*"));  // Permite cualquier origen
        //config.setAllowCredentials(true);
        //config.setAllowedOriginPatterns(List.of("http://localhost", "https://app.sanjuanbosco.edu.pe", "https://sanfernando.edu.pe/fotosaluacad/", "https://sanjuanbosco.edu.pe/worker/", "https://sanfernando.edu.pe", "https://app.sanfernando.edu.pe"));

        config.addAllowedHeader("*");
        config.addAllowedMethod("*");
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
