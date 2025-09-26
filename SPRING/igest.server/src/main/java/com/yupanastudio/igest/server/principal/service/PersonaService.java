/*
 * Document   : PersonaService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.PersonaRepository;
import com.yupanastudio.igest.server.principal.model.Persona;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonaService {

    @Autowired
    PersonaRepository obPersonaRepository;

    public Persona getPersonaById(long idPersona) {
        return obPersonaRepository.findById(idPersona).orElse(null);
    }

    public Persona getPersonaVarios() {
        return obPersonaRepository.findByVarios();
    }

    public List<Persona> getPersonaByNoms(int idEmpresa, String apeNomsRzSoc) {
        apeNomsRzSoc = "%" + apeNomsRzSoc.replace('%', '*').replace(' ', '%') + "%";
        return obPersonaRepository.findByApeNomsRzSoc(idEmpresa, apeNomsRzSoc);
    }

    public Persona getPersonaByNumDoc(int idEmpresa, String numDoc) {
        return obPersonaRepository.findByNumDoc(idEmpresa, numDoc);
    }

    public Persona save(Persona obPersona) {
        if (obPersona.getIdPersona() != null && obPersona.getIdPersona() == -1) {
            obPersona.setIdPersona(null);
        }
        return obPersonaRepository.save(obPersona);
    }

}
