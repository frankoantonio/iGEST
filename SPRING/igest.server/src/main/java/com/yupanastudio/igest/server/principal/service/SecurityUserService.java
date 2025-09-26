/*
 * Document   : SecurityUserService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.SecurityUserRepository;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class SecurityUserService implements UserDetailsService {

    private final SecurityUserRepository obSecurityUserRepository;

    public SecurityUserService(SecurityUserRepository obSecurityUserRepository) {
        this.obSecurityUserRepository = obSecurityUserRepository;
    }

    @Override
    public User loadUserByUsername(String username) {
        try {
            User user = obSecurityUserRepository.getUserByUsername(username);

            List<GrantedAuthority> authorities = obSecurityUserRepository.getUserAuthorities(username);

            if (authorities.isEmpty()) {
                throw new AccessDeniedException("No tienes perfiles/roles asignados.");
            }

            return new User(
                    user.getUsername(),
                    user.getPassword(),
                    user.isEnabled(),
                    true, true, true,
                    authorities
            );
        } catch (EmptyResultDataAccessException ex) {
            throw new BadCredentialsException("No se encontró al usuario, revisa el nombre de usuario y contraseña.", ex);
        }
    }

    public boolean isValidTipUser(String username, int idTipoUsuario) {
        return obSecurityUserRepository.isValidTipUser(username, idTipoUsuario);
    }

}
