/*
 * Document   : MyResponseEntity
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server;

import com.yupanastudio.igest.server.principal.dml.Utils;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class MyResponseEntity<T> {

    private final String msg;
    private final T body;

    public MyResponseEntity(Class<?> entityClass, Exception ex, String grpEmpresa) {
        this.body = null;                                   // no hay cuerpo en caso de error
        String msgEx = ex.getMessage().replace("\n", " ");  // evita saltos de línea

        if (ex instanceof DuplicateKeyException) {
            msg = "DATOS DUPLICADOS! " + getDuplicateKeyMessage(entityClass);
            Utils.crearLog(entityClass, ex, grpEmpresa);
        } else if (ex instanceof AuthenticationException || ex instanceof AccessDeniedException || ex instanceof UsernameNotFoundException) {
            if ("Bad credentials".equals(ex.getMessage())) {
                msg = "AUTENTICACIÓN! No se encontró al usuario, escribe correctamente el nombre de usuario y contraseña.";
            } else if ("User is disabled".equals(ex.getMessage())) {
                msg = "AUTENTICACIÓN! Tu usuario esta inactivo, no podrás ingresar al sistema.";
            } else if ("Without assigned permissions".equals(ex.getMessage())) {
                msg = "AUTENTICACIÓN! Tu usuario no tiene asignado perfiles/roles de sistema.";
            } else {
                msg = "AUTENTICACIÓN! " + msgEx;
                Utils.crearLog(entityClass, ex, grpEmpresa);
            }
        } else {
            msg = "INCIDENTES EN EL SERVIDOR! " + msgEx;
            Utils.crearLog(entityClass, ex, grpEmpresa);
        }
        ex.printStackTrace();
    }

    private String getDuplicateKeyMessage(Class<?> entityClass) {
        return switch (entityClass.getSimpleName()) {
            case "PersonaRST", "PersonaJurRST", "FamiliarRST", "EstudianteColeRST" ->
                "Documento de identidad o nombres ya existen en el sistema. Corrija los datos o cancela la operación y búsquelo.";
            case "DireccionRST" ->
                "Ya existe esta dirección. Búsquelo.";
            case "GrupoFamiliarRST" ->
                "Ya existe este grupo familiar. Cancele la operación y búsquelo.";
            case "InstitucionEstudioRST" ->
                "Ya existe la institución de estudio.";
            case "CampaniaRST" ->
                "Ya existe una campaña con estos datos. Verifica el año y frecuencia, y que el nombre de campaña sea único.";
            default ->
                "Hay algún conflicto de unicidad en " + entityClass.getSimpleName();
        };
    }

    public ResponseEntity<T> getResponse() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("MyMsgERROR", msg);
        return new ResponseEntity<>(body, headers, HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
