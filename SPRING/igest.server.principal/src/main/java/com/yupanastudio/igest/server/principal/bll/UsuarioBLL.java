/*
 * Document   : UsuarioBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.PersonaDAL;
import com.yupanastudio.igest.server.principal.dal.UsuarioDAL;
import com.yupanastudio.igest.server.principal.dml.Persona;
import com.yupanastudio.igest.server.principal.dml.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioBLL {

    @Autowired
    UsuarioDAL obUsuarioDAL;
    @Autowired
    PersonaDAL obPersonaDAL;

    public Usuario getUsuario(long idUsuario) {
        //completar con datos de la persona 
        return obUsuarioDAL.findById(idUsuario).orElse(null);
    }

    public Usuario getUsuario(long idUsuario, boolean cargarPersona) {
        Usuario obUsuario = obUsuarioDAL.findById(idUsuario).orElse(null);
        if (obUsuario != null && cargarPersona) {
            Persona persona = obPersonaDAL.findById(idUsuario).orElse(null); // idPersona = idUsuario
            obUsuario.setObPersona(persona);
        }
        return obUsuario;
    }

//    public Trabajador getTrabajador(long idTrabajador) {
//        //completar con datos de la persona 
//        return obTrabajadorDAL.findById(idTrabajador).orElse(null);
//    }
}
