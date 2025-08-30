/*
 * Document   : AuditoriaBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yupanastudio.igest.server.principal.dal.AuditoriaDAL;
import com.yupanastudio.igest.server.principal.dml.Auditoria;
import java.util.Base64;
import java.util.Map;
import org.springframework.stereotype.Service;

@Service
public class AuditoriaBLL {

//    @Autowired
//    AuditoriaDAL obAuditoriaDAL;
    private final AuditoriaDAL obAuditoriaDAL;
    private final ObjectMapper objectMapper;

    public AuditoriaBLL(AuditoriaDAL obAuditoriaDAL, ObjectMapper objectMapper) {
        this.obAuditoriaDAL = obAuditoriaDAL;
        this.objectMapper = objectMapper;
    }

//    public Auditoria getAuditoria(int idAuditoria) {
//        Auditoria obEmp = obAuditoriaDAL.findById(idAuditoria).orElse(null);
//
//        if (obEmp != null) {
//            obEmp.setLsSedes(obSedeDAL.findByIdAuditoria(idAuditoria));
//            obEmp.setLsSistema(obSistemaDAL.findByIdAuditoria(idAuditoria));
//        }
//
//        return obEmp;
//    }
//    public Auditoria save(Auditoria obAuditoria) {
//        if (obAuditoria.getIdAuditoria() != null && obAuditoria.getIdAuditoria() == -1) {
//            obAuditoria.setIdAuditoria(null);
//        }
//        return obAuditoriaDAL.save(obAuditoria);
//    }

    public void save(String token) {
        try {
            // Extraer la segunda parte del token (Payload)
            String[] parts = token.split("\\.");
            if (parts.length < 2) {
                throw new IllegalArgumentException("Token inválido");
            }
            // Decodificar y parsear el payload
            String payloadJson = new String(Base64.getUrlDecoder().decode(parts[1]));
            Map<String, Object> claims = objectMapper.readValue(payloadJson, Map.class);

            // Crear el objeto de auditoría
            Auditoria obAuditoria = new Auditoria();
            //obAuditoria.setGrmEmp((String) claims.get("grmEmp"));
            obAuditoria.setNomUsuario((String) claims.get("nomUsu"));
            obAuditoria.setIp((String) claims.get("ip"));
            obAuditoria.setHost((String) claims.get("host"));
            obAuditoria.setDispositivo((String) claims.get("device"));

            obAuditoriaDAL.save(obAuditoria);
        } catch (JsonProcessingException | IllegalArgumentException e) {
            throw new RuntimeException("Error al procesar el token JWT", e);
        }
    }

}
