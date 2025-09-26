/*
 * Document   : EmpresaService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yupanastudio.igest.server.principal.repository.EmpresaRepository;
import com.yupanastudio.igest.server.principal.model.Empresa;
import com.yupanastudio.igest.server.principal.controller.SecurityUserController;
import com.yupanastudio.igest.server.principal.controller.SecurityUserController.ConfigUI;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class EmpresaService {

    private final EmpresaRepository obEmpresaRepository;
    private final ObjectMapper obMapper;

    public EmpresaService(EmpresaRepository obEmpresaRepository, ObjectMapper obMapper) {
        this.obEmpresaRepository = obEmpresaRepository;
        this.obMapper = obMapper;
    }

    public List<Empresa> findByRuc(String ruc) {
        return obEmpresaRepository.findByRuc(ruc);
    }

    public SecurityUserController.ConfigUI getConfigUI(String codeName) {
        String json = obEmpresaRepository.findByCodeName(codeName);
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
        return obEmpresaRepository.save(obEmpresa);
    }

}
