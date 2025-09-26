/*
 * Document   : PerfilService
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.service;

import com.yupanastudio.igest.server.principal.repository.PerfilRepository;
import com.yupanastudio.igest.server.principal.model.Perfil;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerfilService {

    @Autowired
    PerfilRepository obPerfilRepository;

    public List<Perfil> getPerfilByIdUsuario(long idUsuario) {
        System.out.println("Service_____________");
        return obPerfilRepository.findByIdUsuario(idUsuario);
    }

}
