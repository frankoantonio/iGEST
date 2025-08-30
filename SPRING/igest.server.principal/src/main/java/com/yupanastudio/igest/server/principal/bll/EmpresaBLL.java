/*
 * Document   : EmpresaBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yupanastudio.igest.server.principal.dal.EmpresaDAL;
import com.yupanastudio.igest.server.principal.dml.Empresa;
import com.yupanastudio.igest.server.principal.rsl.SecurityUserRSL;
import com.yupanastudio.igest.server.principal.rsl.SecurityUserRSL.ConfigUI;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class EmpresaBLL {

    private final EmpresaDAL obEmpresaDAL;
    private final ObjectMapper obMapper;

    public EmpresaBLL(EmpresaDAL obEmpresaDAL, ObjectMapper obMapper) {
        this.obEmpresaDAL = obEmpresaDAL;
        this.obMapper = obMapper;
    }

    public List<Empresa> findByRuc(String ruc) {
        return obEmpresaDAL.findByRuc(ruc);
    }

    public SecurityUserRSL.ConfigUI getConfigUI(String codeName) {
        String json = obEmpresaDAL.findByCodeName(codeName);
        if (json == null || json.isBlank()) {
            return new ConfigUI(1000, "iGEST", "iGEST", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#000000", "#000000", "#000000");
        }
        try {
            return obMapper.readValue(json, ConfigUI.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Error al parsear el JSON de la configuración UI.", e);
        }
    }

    public Empresa save(Empresa obEmpresa) {
        if (obEmpresa.getIdEmpresa() != null && obEmpresa.getIdEmpresa() == -1) {
            obEmpresa.setIdEmpresa(null);
        }
        return obEmpresaDAL.save(obEmpresa);
    }

}
