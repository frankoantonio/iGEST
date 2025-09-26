package com.yupanastudio.igest.server.principal.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

@Repository
public class SecurityUserRepository {

    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[a-zA-Z0-9._-]+$");
    private static final int MAX_USERNAME_LENGTH = 50;

    private final JdbcTemplate jdbcTemplate;

    public SecurityUserRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public User getUserByUsername(String username) {
        validateUsername(username);
        String sanitizedUsername = username.trim();

        try {
            return jdbcTemplate.queryForObject(
                    "SELECT nom_usu AS username, pwd_usu AS password, activo AS enabled FROM usuario WHERE nom_usu = ?",
                    (rs, rowNum) -> new User(
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getBoolean("enabled"),
                            true, true, true,
                            Collections.emptyList()
                    ),
                    sanitizedUsername
            );
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("Usuario no encontrado: " + sanitizedUsername, e);
        }
    }

    public boolean isValidTipUser(String username, int idTipoUsuario) {
        validateUsername(username);
        String sanitizedUsername = username.trim();

        String sql = """
                SELECT EXISTS (
                    SELECT 1
                    FROM usuario A
                    INNER JOIN usuario_tipo B ON A.id_usuario = B.id_usuario
                    WHERE A.nom_usu = ? AND B.id_tipo_usuario = ?
                )
                """;

        Boolean result = jdbcTemplate.queryForObject(sql, Boolean.class, sanitizedUsername, idTipoUsuario);
        return Boolean.TRUE.equals(result);
    }

    public List<GrantedAuthority> getUserAuthorities(String username) {
        validateUsername(username);
        String sanitizedUsername = username.trim();

        String sql = """
                SELECT ruta AS modulo, B.ver, B.crear, B.editar, B.eliminar
                FROM usuario A
                    INNER JOIN usuario_perfil B ON A.id_usuario = B.id_usuario
                    INNER JOIN perfil C ON B.id_perfil = C.id_perfil
                WHERE ruta IS NOT NULL AND ruta <> '' AND nom_usu = ?
                """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
                    List<GrantedAuthority> permissions = new ArrayList<>();
                    String modulo = rs.getString("modulo");

                    addPermissionIfGranted(permissions, rs, "ver", modulo + ":GET");
                    addPermissionIfGranted(permissions, rs, "crear", modulo + ":POST");
                    addPermissionIfGranted(permissions, rs, "editar", modulo + ":PUT");
                    addPermissionIfGranted(permissions, rs, "eliminar", modulo + ":DELETE");

                    return permissions;
                }, sanitizedUsername)
                .stream()
                .flatMap(List::stream)
                .toList();
    }

    private void validateUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            throw new IllegalArgumentException("Username cannot be null or empty");
        }

        String trimmed = username.trim();
        if (trimmed.length() > MAX_USERNAME_LENGTH) {
            throw new IllegalArgumentException("Username too long (max " + MAX_USERNAME_LENGTH + " characters)");
        }

        if (!USERNAME_PATTERN.matcher(trimmed).matches()) {
            throw new IllegalArgumentException("Username contains invalid characters");
        }
    }

    private void addPermissionIfGranted(List<GrantedAuthority> permissions,
                                        java.sql.ResultSet rs,
                                        String columnName,
                                        String permission) throws java.sql.SQLException {
        if (rs.getBoolean(columnName)) {
            permissions.add(new SimpleGrantedAuthority(permission));
        }
    }

}
