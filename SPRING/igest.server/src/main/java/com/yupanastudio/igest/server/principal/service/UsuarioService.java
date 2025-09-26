/*
 * Document   : UsuarioService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.PersonaRepository;
import com.yupanastudio.igest.server.principal.repository.UsuarioRepository;
import com.yupanastudio.igest.server.principal.model.Persona;
import com.yupanastudio.igest.server.principal.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    UsuarioRepository obUsuarioRepository;
    @Autowired
    PersonaRepository obPersonaRepository;

    public Usuario getUsuario(long idUsuario) {
        //completar con datos de la persona 
        return obUsuarioRepository.findById(idUsuario).orElse(null);
    }

    public Usuario getUsuario(long idUsuario, boolean cargarPersona) {
        Usuario obUsuario = obUsuarioRepository.findById(idUsuario).orElse(null);
        if (obUsuario != null && cargarPersona) {
            Persona persona = obPersonaRepository.findById(idUsuario).orElse(null); // idPersona = idUsuario
            obUsuario.setObPersona(persona);
        }
        return obUsuario;
    }

//    public Trabajador getTrabajador(long idTrabajador) {
//        //completar con datos de la persona 
//        return obTrabajadorRepository.findById(idTrabajador).orElse(null);
//    }
}
