/*
 * Document   : SecurityUserBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.SecurityUserDAL;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class SecurityUserBLL implements UserDetailsService {

    private final SecurityUserDAL obSecurityUserDAL;

    public SecurityUserBLL(SecurityUserDAL obSecurityUserDAL) {
        this.obSecurityUserDAL = obSecurityUserDAL;
    }

    @Override
    public User loadUserByUsername(String username) {
        try {
            User user = obSecurityUserDAL.getUserByUsername(username);

            List<GrantedAuthority> authorities = obSecurityUserDAL.getUserAuthorities(username);

            if (authorities.isEmpty()) {
                throw new AccessDeniedException("No tienes perfiles/roles asignados.");
            }

            return new org.springframework.security.core.userdetails.User(
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
        return obSecurityUserDAL.isValidTipUser(username, idTipoUsuario);
    }

}
