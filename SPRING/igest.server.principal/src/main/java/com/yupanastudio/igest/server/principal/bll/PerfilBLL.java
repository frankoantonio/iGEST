/*
 * Document   : PerfilBLL
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.bll;

import com.yupanastudio.igest.server.principal.dal.PerfilDAL;
import com.yupanastudio.igest.server.principal.dml.Perfil;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerfilBLL {

    @Autowired
    PerfilDAL obPerfilDAL;

    public List<Perfil> getPerfilByIdUsuario(long idUsuario) {
        System.out.println("BLL_____________");
        return obPerfilDAL.findByIdUsuario(idUsuario);
    }

}
