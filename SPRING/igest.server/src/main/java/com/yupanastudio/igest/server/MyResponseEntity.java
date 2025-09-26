package com.yupanastudio.igest.server;

import com.yupanastudio.igest.server.principal.model.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class MyResponseEntity<T> {

    private static final Logger logger = LoggerFactory.getLogger(MyResponseEntity.class);
    private static final String GENERIC_ERROR_MSG = "INCIDENTES EN EL SERVIDOR! Ha ocurrido un error interno. Contacte al administrador si el problema persiste.";

    private final String message;
    private final HttpStatus status;

    public MyResponseEntity(Class<?> entityClass, Exception ex, String grpEmpresa) {
        this.message = buildErrorMessage(ex, entityClass);
        this.status = determineHttpStatus(ex);

        logException(entityClass, ex, grpEmpresa);
    }

    private String buildErrorMessage(Exception ex, Class<?> entityClass) {
        if (ex instanceof DuplicateKeyException) {
            return "DATOS DUPLICADOS! " + getDuplicateKeyMessage(entityClass);
        }

        if (isAuthenticationRelated(ex)) {
            return buildAuthenticationMessage(ex);
        }

        return GENERIC_ERROR_MSG;
    }

    private boolean isAuthenticationRelated(Exception ex) {
        return ex instanceof AuthenticationException
                || ex instanceof AccessDeniedException
                || ex instanceof UsernameNotFoundException;
    }

    private String buildAuthenticationMessage(Exception ex) {
        String exMessage = ex.getMessage();
        return switch (exMessage) {
            case "Bad credentials" ->
                    "AUTENTICACIÓN! No se encontró al usuario, escribe correctamente el nombre de usuario y contraseña.";
            case "User is disabled" -> "AUTENTICACIÓN! Tu usuario esta inactivo, no podrás ingresar al sistema.";
            case "Without assigned permissions" ->
                    "AUTENTICACIÓN! Tu usuario no tiene asignado perfiles/roles de sistema.";
            default -> "AUTENTICACIÓN! Error de autenticación.";
        };
    }

    private HttpStatus determineHttpStatus(Exception ex) {
        if (ex instanceof AuthenticationException || ex instanceof AccessDeniedException) {
            return HttpStatus.UNAUTHORIZED;
        }
        if (ex instanceof DuplicateKeyException) {
            return HttpStatus.CONFLICT;
        }
        return HttpStatus.INTERNAL_SERVER_ERROR;
    }

    private void logException(Class<?> entityClass, Exception ex, String grpEmpresa) {
        if (!(ex instanceof AuthenticationException)) {
            try {
                Utils.crearLog(entityClass, ex, grpEmpresa);
            } catch (Exception logException) {
                logger.error("Error creating log entry", logException);
            }
        }
    }

    private String getDuplicateKeyMessage(Class<?> entityClass) {
        return switch (entityClass.getSimpleName()) {
            case "PersonaController", "PersonaJurController", "FamiliarController", "EstudianteColeController" ->
                    "Documento de identidad o nombres ya existen en el sistema. Corrija los datos o cancela la operación y búsquelo.";
            case "DireccionController" -> "Ya existe esta dirección. Búsquelo.";
            case "GrupoFamiliarController" -> "Ya existe este grupo familiar. Cancele la operación y búsquelo.";
            case "InstitucionEstudioController" -> "Ya existe la institución de estudio.";
            case "CampaniaController" ->
                    "Ya existe una campaña con estos datos. Verifica el año y frecuencia, y que el nombre de campaña sea único.";
            default -> "Hay algún conflicto de unicidad en " + entityClass.getSimpleName();
        };
    }

    public ResponseEntity<T> getResponse() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Error-Message", message);
        return new ResponseEntity<>(null, headers, status);
    }

}
