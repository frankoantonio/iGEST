/*
 * Document   : SecurityUserDAL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

@Repository
public class SecurityUserDAL {

    private final JdbcTemplate jdbc;

    public SecurityUserDAL(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public User getUserByUsername(String username) {
        return jdbc.queryForObject(
                "SELECT nom_usu AS username, pwd_usu AS password, activo AS enabled FROM usuario WHERE nom_usu = ? ",
                new Object[]{username},
                (rs, rowNum) -> new User(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getBoolean("enabled"),
                        true, true, true,
                        Collections.emptyList()
                ));
    }

    public boolean isValidTipUser(String username, int idTipoUsuario) {
        String sql = """
                SELECT EXISTS (
                    SELECT 1
                    FROM usuario A
                    INNER JOIN usuario_tipo B ON A.id_usuario = B.id_usuario
                    WHERE A.nom_usu = ? AND B.id_tipo_usuario = ?
                 );
                 """;
        Boolean result = jdbc.queryForObject(sql, Boolean.class, username, idTipoUsuario);
        return Boolean.TRUE.equals(result);
    }

    public List<GrantedAuthority> getUserAuthorities(String username) {
        return jdbc.query(
                """
                SELECT ruta AS modulo, B.ver, B.crear, B.editar, B.eliminar 
                FROM usuario A 
                    INNER JOIN usuario_perfil B ON (A.id_usuario = B.id_usuario) 
                    INNER JOIN perfil C ON (B.id_perfil = C.id_perfil) 
                    WHERE (ruta IS NOT NULL AND ruta <> '') AND nom_usu = ?                         
                """,
                new Object[]{username},
                (rs, rowNum) -> {
                    List<GrantedAuthority> perms = new ArrayList<>();
                    String modulo = rs.getString("modulo");
                    if (rs.getBoolean("ver")) {
                        perms.add(new SimpleGrantedAuthority(modulo + ":GET"));
                    }
                    if (rs.getBoolean("crear")) {
                        perms.add(new SimpleGrantedAuthority(modulo + ":POST"));
                    }
                    if (rs.getBoolean("editar")) {
                        perms.add(new SimpleGrantedAuthority(modulo + ":PUT"));
                    }
                    if (rs.getBoolean("eliminar")) {
                        perms.add(new SimpleGrantedAuthority(modulo + ":DELETE"));
                    }
                    return perms;
                }).stream().flatMap(List::stream).toList();
    }

}
