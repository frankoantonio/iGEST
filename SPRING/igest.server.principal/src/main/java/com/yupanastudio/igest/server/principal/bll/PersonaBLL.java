/*
 * Document   : PersonaBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.PersonaDAL;
import com.yupanastudio.igest.server.principal.dml.Persona;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonaBLL {

    @Autowired
    PersonaDAL obPersonaDAL;

    public Persona getPersonaById(long idPersona) {
        return obPersonaDAL.findById(idPersona).orElse(null);
    }

    public Persona getPersonaVarios() {
        return obPersonaDAL.findByVarios();
    }

    public List<Persona> getPersonaByNoms(int idEmpresa, String apeNomsRzSoc) {
        apeNomsRzSoc = "%" + apeNomsRzSoc.replace('%', '*').replace(' ', '%') + "%";
        return obPersonaDAL.findByApeNomsRzSoc(idEmpresa, apeNomsRzSoc);
    }

    public Persona getPersonaByNumDoc(int idEmpresa, String numDoc) {
        return obPersonaDAL.findByNumDoc(idEmpresa, numDoc);
    }

    public Persona save(Persona obPersona) {
        if (obPersona.getIdPersona() != null && obPersona.getIdPersona() == -1) {
            obPersona.setIdPersona(null);
        }
        return obPersonaDAL.save(obPersona);
    }

}
